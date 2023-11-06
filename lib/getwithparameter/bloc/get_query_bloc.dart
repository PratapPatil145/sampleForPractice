


import 'dart:async';
import 'dart:developer';

import '../../base/base_response.dart';
import '../../base/bloc.dart';
import '../model/get_q_model.dart';
import '../repo/get_q_repo.dart';

class GetQBloc extends Bloc{
  
  StreamController<Response<List<GetQModel>>> loginstreamcontroller=StreamController<Response<List<GetQModel>>>();
  Stream<Response<List<GetQModel>>> get loginauthmethodstream=>loginstreamcontroller.stream;
  StreamSink<Response<List<GetQModel>>>get loginauthmethodsink=>loginstreamcontroller.sink;

  final sample=GetQRepository();

  void methodForData (Map<String,dynamic> map)async{
    loginauthmethodsink.add(Response.loading("loading"));
    try{
      final client =await sample.GetQDataPasss(map
      );
      loginauthmethodsink.add(Response.completed(client));
    }catch(e){
      loginauthmethodsink.add(Response.error(e.toString()));
log("format:${e.toString()}");
    }
  }

  @override
  void dispose() {
    loginstreamcontroller.close();
  }

}