import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapiintegration/base/basehttp.dart';

import '../../base/api_constants.dart';
import '../model/model.dart';

class Repo {
  Future<GetDataModel> modemethod() async {
    BaseHttp basehttp = BaseHttp();
    print("${ApiConstants.url}");
    final response = await basehttp.get(ApiConstants.url);
    print("ith_kay_yet_ahe${response.toString()}");

    print("Molding:${response}");

    return GetDataModel.fromJson(jsonDecode(response));
  }
}
