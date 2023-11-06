import 'package:flutter/material.dart';

class GetDataModel {
  String? tokenType;
  String? token;
  String? expiresIn;

  GetDataModel({this.tokenType, this.token, this.expiresIn});

  GetDataModel.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    token = json['token'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_type'] = this.tokenType;
    data['token'] = this.token;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}