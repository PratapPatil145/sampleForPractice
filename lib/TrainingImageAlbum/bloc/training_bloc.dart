import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';


import 'package:getapiintegration/TrainingImageAlbum/model/training_model.dart';
import 'package:getapiintegration/base/base_response.dart';

import '../../base/bloc.dart';
import '../repo/training_repository.dart';



class TrainingBloc extends Bloc{

  StreamController<Response<TrainingModel>> trainingstreamcontroller = StreamController<Response<TrainingModel>>();

  
  Stream<Response<TrainingModel>> get trainingstream => trainingstreamcontroller.stream;
  StreamSink<Response<TrainingModel>>get trainingsink => trainingstreamcontroller.sink;

  final trainingrepo = TrainingRepo();

  void trainingMethod(dynamic map)async{
    trainingsink.add(Response.loading("Loading"));
    try{
      final client = await  trainingrepo.trainingRepoMethod(map);
      trainingsink.add(Response.completed(client));

    }catch(e){
      trainingsink.add(Response.error(e.toString()));
      log("Training: ${e.toString()}");

    }
  }

  @override
  void dispose(){
    trainingstreamcontroller.close();

  }
}