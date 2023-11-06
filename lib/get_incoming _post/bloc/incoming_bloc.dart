import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:getapiintegration/base/base_response.dart';

import '../../base/bloc.dart';
import '../model/incoming_model.dart';
import '../repo/incoming_repository.dart';

class IncomingPostBloc extends Bloc {
  StreamController<Response<IncomingModel>> incomingstreamcontroller =
      StreamController<Response<IncomingModel>>();

  Stream<Response<IncomingModel>> get incomingstream =>
      incomingstreamcontroller.stream;
  StreamSink<Response<IncomingModel>> get incomingsink =>
      incomingstreamcontroller.sink;

  final incomingrepo = IncomingRepo();

  void IncomingMethod(dynamic map) async {
    incomingsink.add(Response.loading("Loading"));
    try {
      final client = await incomingrepo.IncomingRepoMethod(map);
      incomingsink.add(Response.completed(client));
    } catch (e) {
      incomingsink.add(Response.error(e.toString()));
      log("Incoming: ${e.toString()}");
    }
  }

  @override
  void dispose() {
    incomingstreamcontroller.close();
  }
}
