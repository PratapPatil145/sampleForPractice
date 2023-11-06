import 'package:flutter/material.dart';
import 'package:getapiintegration/TrainingImageAlbum/model/training_model.dart';
import 'package:getapiintegration/base/api_constants.dart';
import 'package:getapiintegration/base/basehttp.dart';

class TrainingRepo {
  Future<TrainingModel> trainingRepoMethod(dynamic body) async {
    BaseHttp baseHTTP = BaseHttp();

    final response = await baseHTTP.postWithBody2(ApiConstants.TRAINING_URL, body);
    return TrainingModel.fromJson(response);
  }
}
