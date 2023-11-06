import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapiintegration/TrainingImageAlbum/model/training_model.dart';

import '../../base/base_response.dart';
import '../bloc/training_bloc.dart';

class TrainingUiPage extends StatefulWidget {
  const TrainingUiPage({super.key});

  @override
  State<TrainingUiPage> createState() => _TrainingUiPageState();
}

class _TrainingUiPageState extends State<TrainingUiPage> {
  TrainingBloc trainingbloc = TrainingBloc();
  //List<TrainingModelData>? data = [];
  List<Data>? data = [];
  var x;
  @override
  void initState() {
    var map = {"BranchCode": "B3", "CompanyId": "9"};
    var body = jsonEncode(map);
    trainingbloc.trainingMethod(body);

    trainingbloc.trainingstream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          setState(() {});
          break;
        case Status.COMPLETED:
          setState(() {
            data = event.data!.data;
            x = event.data!.statusCode;
            print("this is x value${x}");
          });
          break;
        case Status.ERROR:
          setState(() {});
          break;
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: data!.isEmpty
          ? Container(
              child: Text("No Data"),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: data!.length,
              itemBuilder: (context, index) {
                Text(data![index].rotaId.toString(),style: TextStyle(fontSize: 12,color: Colors.black),);
                print("rotaid${data![index].rotaId.toString()}");

                // Text("abcd");
                Text(data![index].branch.toString());
              }),
    ));
  }
}
