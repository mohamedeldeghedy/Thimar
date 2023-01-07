import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/foundation.dart';
import 'package:quick_log/quick_log.dart';

import '../generated/locale_keys.g.dart';
import 'cache_helper.dart';

Logger log = const Logger("");

class ServerGate {
  Dio dio =
      Dio(BaseOptions(baseUrl: "https://thimar.amr.aait-d.com/api/", headers: {
    "Authorization": "Bearer ${CacheHelper.getToken()}",
    "Accept": "application/json",
    "Accept-Language": "ar",
  }));

  ServerGate() {
    addInterceptors();
  }

  void addInterceptors() {
    dio.interceptors.add(CustomApiInterceptor());
  }

  StreamController<double> onSingleReceive = StreamController.broadcast();

  Future<CustomResponse> sendToServer({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    if (body != null) {
      body.removeWhere(
        (key, value) => body[key] == null || body[key] == "",
      );
    }
    if (body != null) {
      Map<String, String> logBody = {};
      body.forEach((key, value) {
        logBody.addAll({key.toString(): value.toString()});
      });
      log.info(body);
    }
    try {
      Response response = await dio.post(
        url,
        data: FormData.fromMap(body ?? {}),
        onSendProgress: (received, total) {
          onSingleReceive.add((received / total) - 0.05);
        },
        options: Options(
          sendTimeout: 5000,
          receiveTimeout: 5000,
          contentType:
              "multipart/form-data; boundary=<calculated when request is sent>",
        ),
      );

      return CustomResponse(
        success: true,
        statusCode: 200,
        errType: null,
        error: null,
        msg: response.data["message"] ?? "Your request completed successfully",
        response: response,
      );
    } on DioError catch (err) {
      return handleServerError(err);
    }
  }

  Future<CustomResponse> getFromServer({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  }) async {
    if (params != null) {
      params.removeWhere(
          (key, value) => params[key] == null || params[key] == "");
    }
    try {
      Response response = await dio.get(
        url,
        options: Options(
          headers: headers,
          sendTimeout: 5000,
          receiveTimeout: 5000,
        ),
        queryParameters: params,
      );

      return CustomResponse(
        success: true,
        statusCode: 200,
        errType: null,
        error: null,
        msg: (response.data["message"] ?? "Your request completed successfully")
            .toString(),
        response: response,
      );
    } on DioError catch (err) {
      return handleServerError(err);
    }
  }

  CustomResponse handleServerError(DioError err) {
    if (err.type == DioErrorType.response) {
      if (err.response!.data.toString().contains("DOCTYPE") ||
          err.response!.data.toString().contains("<script>") ||
          err.response!.data["exception"] != null) {
        return CustomResponse(
          errType: 2,
          statusCode: err.response!.statusCode ?? 500,
          msg: LocaleKeys.serverError.tr(),
          response: null,
        );
      }
      // if (err.response!.statusCode == 401) {
      // CacheHelper.removeUserToken();
      // CacheHelper.setIfIsVisitor(true);
      // navigateTo(navigator.currentContext, page: HomeScreen(), leaveHistory: false);
      // }
      try {
        return CustomResponse(
          statusCode: err.response?.statusCode ?? 500,
          errType: 1,
          msg: (err.response!.data["errors"] as Map).values.first.first,
          error: null,
          response: err.response,
        );
      } catch (e) {
        return CustomResponse(
          statusCode: err.response?.statusCode ?? 500,
          errType: 1,
          msg: err.response?.data["message"],
          error: null,
          response: err.response,
        );
      }
    } else if (err.type == DioErrorType.receiveTimeout ||
        err.type == DioErrorType.sendTimeout) {
      return CustomResponse(
        statusCode: err.response?.statusCode ?? 500,
        errType: 0,
        msg: LocaleKeys.noConnection.tr(),
        error: null,
        response: null,
      );
    } else {
      if (err.response == null) {
        return CustomResponse(
          statusCode: 402,
          errType: 0,
          msg: LocaleKeys.noConnection.tr(),
          error: null,
          response: null,
        );
      }
      return CustomResponse(
        statusCode: 402,
        errType: 2,
        msg: LocaleKeys.serverError.tr(),
        error: null,
        response: null,
      );
    }
  }
}

class CustomApiInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      printResponse(err.response!);
      log.error((err.response!.data ?? "").toString());
      // log.info("\x1B[50m( Headers )\x1B[0m");
      // if (err.requestOptions.headers.isNotEmpty) {
      //   err.requestOptions.headers.forEach((key, value) {
      //     log.info("\x1B[15m$key : $value\x1B[0m");
      //   });
      // } else {
      //   log.info("\x1B[15mNo Headers\x1B[0m");
      // }
      // log.fine("\x1B[15m( Query Parameters )\x1B");
      // if (err.requestOptions.queryParameters.isNotEmpty) {
      //   err.requestOptions.queryParameters.forEach((key, value) {
      //     log.fine("\x1B[15m$key : $value\x1B[0m");
      //   });
      // } else {
      //   log.fine("\x1B[15mNo Parameters\x1B[0m");
      // }
      // log.error("\x1B[37mResponse Error\x1B[0m");
      // log.warning("\x1B[31m${err.response?.data}\x1B[0m");
    }
    return super.onError(err, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (kDebugMode) {
      printResponse(response);
    }
    return super.onResponse(response, handler);
  }
}

class CustomResponse {
  bool success;
  int? errType;

  // 0 => network error
  // 1 => error from the server
  // 2 => other error
  String msg;
  int statusCode;
  Response? response;
  dynamic error;

  CustomResponse({
    this.success = false,
    this.errType = 0,
    this.msg = "",
    this.statusCode = 0,
    this.response,
    this.error,
  });
}

printResponse(Response response) {
  log.warning(
      "---------------------Start Of Request Details ---------------------------");
  log.warning(
      "\x1B[31m(${response.requestOptions.method}) ( ${response.requestOptions.baseUrl + response.requestOptions.path} )");
  log.info("\x1B[50m( Headers )\x1B[0m");
  if (response.requestOptions.headers.isNotEmpty) {
    response.requestOptions.headers.forEach((key, value) {
      log.info("\x1B[15m$key : $value\x1B[0m");
    });
  } else {
    log.info("\x1B[15mNo Headers\x1B[0m");
  }
  if (response.requestOptions.method == "GET") {
    log.fine("\x1B[15m( Query Parameters )\x1B");
    if (response.requestOptions.queryParameters.isNotEmpty) {
      response.requestOptions.queryParameters.forEach((key, value) {
        log.fine("\x1B[15m$key : $value\x1B[0m");
      });
    } else {
      log.fine("\x1B[15mNo Parameters\x1B[0m");
    }
  } else {
    log.fine("\x1B[15m( Data )\x1B");
    FormData data = response.requestOptions.data;
    if (data.fields.isNotEmpty) {
      data.fields.forEach((element) {
        log.fine("\x1B[15m${element.key} : ${element.value}\x1B[0m");
      });
    } else {
      log.fine("\x1B[15mNo Data\x1B[0m");
    }
  }

  log.fine(
      "\x1B[15m--------------------- Response ---------------------------\x1B[0m");
  var resp = jsonEncode(response.data);
  resp
      .replaceAll("]", "\n]\n")
      .replaceAll("[", "\n[\n")
      .replaceAll("{", "\n{\n")
      .replaceAll("}", "\n}\n")
      .split(",")
      .forEach((element) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(element).forEach((match) => debugPrint(match.group(0)));
  });
  log.debug(
      "---------------------End Of Request Details ---------------------------");
}
