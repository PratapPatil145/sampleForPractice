
import 'package:getapiintegration/base/api_constants.dart';
import 'package:getapiintegration/base/basehttp.dart';
import 'dart:convert';
import 'dart:io';
import 'package:getapiintegration/get_incoming%20_post/model/incoming_model.dart';

class IncomingRepo {
  Future<IncomingModel> IncomingRepoMethod(dynamic body) async {
    BaseHttp baseHTTP = BaseHttp();

    final response = await baseHTTP.postWithBody2(ApiConstants.Incoming_URL, body);
    return IncomingModel.fromJson(response);
  }
}
