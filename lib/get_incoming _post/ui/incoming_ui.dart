import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:getapiintegration/get_incoming%20_post/model/incoming_model.dart';

import '../../base/base_response.dart';
import '../bloc/incoming_bloc.dart';

class IncomingUiPage extends StatefulWidget {
  const IncomingUiPage({super.key});

  @override
  State<IncomingUiPage> createState() => _IncomingUiPageState();
}

class _IncomingUiPageState extends State<IncomingUiPage> {
  IncomingPostBloc incomingbloc = IncomingPostBloc();
  //List<TrainingModelData>? data = [];
  List<Data>? data = [];
  var x;
  @override
  void initState() {
    var map = {
      "searchString": "",
      "userId": "2",
      "subcategoryId": [
        60,
        61,
        112,
        111,
        130,
        69,
        64,
        65,
        66,
        212,
        213,
        214,
        215,
        216,
        67
      ],
      "pageNumber": 1
    };
    var body = jsonEncode(map);
    incomingbloc.IncomingMethod(body);

    incomingbloc.incomingstream.listen((event) {
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
                Text(
                  data![index].chatId.toString(),
                  style: TextStyle(fontSize: 12, color: Colors.black),
                );
                print("rotaid${data![index].commentCount.toString()}");

                // Text("abcd");
                Text(data![index].chatComments.toString());
              }),
    ));
  }
}
