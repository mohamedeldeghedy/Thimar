import 'package:flutter/material.dart';

class SliderModel {

  late final List<SliderData> data;
  late final String status;
  late final String message;

  SliderModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>SliderData.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }

}

class SliderData {

  late final int id;
  late final String media;

  SliderData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    media = json['media'];
  }

}