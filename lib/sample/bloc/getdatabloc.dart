import 'dart:async';
import 'dart:developer';

import 'package:getapiintegration/sample/model/model.dart';
import 'package:getapiintegration/sample/repo/repo.dart';

import '../../base/base_response.dart';

import '../../base/bloc.dart';

class GetDataBloc extends Bloc {
  StreamController<Response<GetDataModel>> getdatastreamcontroller =
      StreamController<Response<GetDataModel>>();
  Stream<Response<GetDataModel>> get getdatastream =>
      getdatastreamcontroller.stream;
  StreamSink<Response<GetDataModel>> get getdatasink =>
      getdatastreamcontroller.sink;

  final moldrespository = Repo();

  void moldmethod() async {
    getdatasink.add(Response.loading("Loading"));
    try {
      final client = await moldrespository.modemethod();
      getdatasink.add(Response.completed(client));
    } catch (e) {
      getdatasink.add(Response.error(e.toString()));
      log("molding: ${e.toString()}");
    }
  }

  @override
  void dispose() {
    getdatastreamcontroller.close();
  }
}
