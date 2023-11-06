import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:getapiintegration/getwithparameter/bloc/get_query_bloc.dart';
import 'package:getapiintegration/getwithparameter/model/get_q_model.dart';

import '../../base/base_response.dart';

class GetWithQUIPage extends StatefulWidget {
  GetWithQUIPage({
    super.key,
  });

  @override
  State<GetWithQUIPage> createState() => _GetWithQUIPageState();
}

class _GetWithQUIPageState extends State<GetWithQUIPage> {
  GetQBloc getqbloc = GetQBloc();
  List<GetQModel>? modeldata = [];

  @override
  void initState() {
    callLoginApi();

    getqbloc.loginauthmethodstream.listen((event) async {
      switch (event.status) {
        case Status.LOADING:
          CircularProgressIndicator();
          // await ApiCall().showLoaderDialog(context);
          break;
        case Status.COMPLETED:
          setState(() {
            modeldata = event.data;
            //formdata= event.data;
          });

          break;

        case Status.ERROR:
          log("error: ${event.message}");

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
        child: modeldata!.isEmpty
            ? Container()
            : ListView.builder(
                itemCount: modeldata!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          modeldata![index].taskName!,
                          style: TextStyle(
                            fontFamily: "Medium",
                            fontSize: 17,
                            //color: HexColor("#000000")
                          ),
                        ),
                        if (modeldata![index].formList != null &&
                            modeldata![index].formList!.isNotEmpty)
                          Text(
                            modeldata![index]
                                .formList![0]
                                .isCompleted
                                .toString(),
                          ),
                        //tickmark icon
                        Icon(Icons.circle),
                        // Text(modeldata![index].formList![index].formId.toString()),
                      ],
                    ),
                  );
                }),
      ),
    );
  }

  Future<void> callLoginApi() async {
    Map<String, dynamic> body = {"UserId": "256"};
    getqbloc.methodForData(body);
  }
}
