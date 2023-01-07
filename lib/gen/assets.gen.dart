/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Location1.png
  AssetGenImage get location1 =>
      const AssetGenImage('assets/icons/Location1.png');

  /// File path: assets/icons/all.png
  AssetGenImage get all => const AssetGenImage('assets/icons/all.png');

  /// File path: assets/icons/app_logo.png
  AssetGenImage get appLogo => const AssetGenImage('assets/icons/app_logo.png');

  /// File path: assets/icons/app_logo2.png
  AssetGenImage get appLogo2 =>
      const AssetGenImage('assets/icons/app_logo2.png');

  /// File path: assets/icons/arrow-Left.png
  AssetGenImage get arrowLeft =>
      const AssetGenImage('assets/icons/arrow-Left.png');

  /// File path: assets/icons/arrow-Right.png
  AssetGenImage get arrowRight =>
      const AssetGenImage('assets/icons/arrow-Right.png');

  /// File path: assets/icons/arrowDown.png
  AssetGenImage get arrowDown =>
      const AssetGenImage('assets/icons/arrowDown.png');

  /// File path: assets/icons/arrowTop.png
  AssetGenImage get arrowTop =>
      const AssetGenImage('assets/icons/arrowTop.png');

  /// File path: assets/icons/big_map.png
  AssetGenImage get bigMap => const AssetGenImage('assets/icons/big_map.png');

  /// File path: assets/icons/calling.png
  AssetGenImage get calling => const AssetGenImage('assets/icons/calling.png');

  /// File path: assets/icons/check.png
  AssetGenImage get check => const AssetGenImage('assets/icons/check.png');

  /// File path: assets/icons/check_icon.png
  AssetGenImage get checkIcon =>
      const AssetGenImage('assets/icons/check_icon.png');

  /// File path: assets/icons/condition.png
  AssetGenImage get condition =>
      const AssetGenImage('assets/icons/condition.png');

  /// File path: assets/icons/dollar.png
  AssetGenImage get dollar => const AssetGenImage('assets/icons/dollar.png');

  /// File path: assets/icons/edit.png
  AssetGenImage get edit => const AssetGenImage('assets/icons/edit.png');

  /// File path: assets/icons/flag.png
  AssetGenImage get flag => const AssetGenImage('assets/icons/flag.png');

  /// File path: assets/icons/info.png
  AssetGenImage get info => const AssetGenImage('assets/icons/info.png');

  /// File path: assets/icons/lang.png
  AssetGenImage get lang => const AssetGenImage('assets/icons/lang.png');

  /// File path: assets/icons/left_arrow.png
  AssetGenImage get leftArrow =>
      const AssetGenImage('assets/icons/left_arrow.png');

  /// File path: assets/icons/location.png
  AssetGenImage get location =>
      const AssetGenImage('assets/icons/location.png');

  /// File path: assets/icons/note.png
  AssetGenImage get note => const AssetGenImage('assets/icons/note.png');

  /// File path: assets/icons/person.png
  AssetGenImage get person => const AssetGenImage('assets/icons/person.png');

  /// File path: assets/icons/phone.png
  AssetGenImage get phone => const AssetGenImage('assets/icons/phone.png');

  /// File path: assets/icons/question.png
  AssetGenImage get question =>
      const AssetGenImage('assets/icons/question.png');

  /// File path: assets/icons/saudi.png
  AssetGenImage get saudi => const AssetGenImage('assets/icons/saudi.png');

  /// File path: assets/icons/setting.png
  AssetGenImage get setting => const AssetGenImage('assets/icons/setting.png');

  /// File path: assets/icons/share.png
  AssetGenImage get share => const AssetGenImage('assets/icons/share.png');

  /// File path: assets/icons/star.png
  AssetGenImage get star => const AssetGenImage('assets/icons/star.png');

  /// File path: assets/icons/steak.png
  AssetGenImage get steak => const AssetGenImage('assets/icons/steak.png');

  /// File path: assets/icons/thanks.png
  AssetGenImage get thanks => const AssetGenImage('assets/icons/thanks.png');

  /// File path: assets/icons/tomato.png
  AssetGenImage get tomato => const AssetGenImage('assets/icons/tomato.png');

  /// File path: assets/icons/turn_off.png
  AssetGenImage get turnOff => const AssetGenImage('assets/icons/turn_off.png');

  /// File path: assets/icons/unlock.png
  AssetGenImage get unlock => const AssetGenImage('assets/icons/unlock.png');

  /// File path: assets/icons/wallet.png
  AssetGenImage get wallet => const AssetGenImage('assets/icons/wallet.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        location1,
        all,
        appLogo,
        appLogo2,
        arrowLeft,
        arrowRight,
        arrowDown,
        arrowTop,
        bigMap,
        calling,
        check,
        checkIcon,
        condition,
        dollar,
        edit,
        flag,
        info,
        lang,
        leftArrow,
        location,
        note,
        person,
        phone,
        question,
        saudi,
        setting,
        share,
        star,
        steak,
        thanks,
        tomato,
        turnOff,
        unlock,
        wallet
      ];
}

class $AssetsLangGen {
  const $AssetsLangGen();

  /// File path: assets/lang/ar.json
  String get ar => 'assets/lang/ar.json';

  /// File path: assets/lang/en.json
  String get en => 'assets/lang/en.json';

  /// List of all assets
  List<String> get values => [ar, en];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLangGen lang = $AssetsLangGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
