import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:getapiintegration/main.dart';
import 'package:getapiintegration/sample/bloc/GetDataBloc.dart';
import 'package:getapiintegration/sample/model/model.dart';
import 'package:getapiintegration/sharedpreference/shared_preference.dart';

import '../../base/base_response.dart';
import '../../get_incoming _post/ui/incoming_ui.dart';

class GetApiUiPage extends StatefulWidget {
  const GetApiUiPage({super.key});

  @override
  State<GetApiUiPage> createState() => _GetApiUiPageState();
}

class _GetApiUiPageState extends State<GetApiUiPage> {
  GetDataBloc getdatabloc = GetDataBloc();
  GetDataModel getDataModel = GetDataModel();
  var data;
  var xyz;
  @override
  void initState() {
    getdatabloc.moldmethod();

    getdatabloc.getdatastream.listen((event) async {
      switch (event.status) {
        case Status.LOADING:
          CircularProgressIndicator();
          // await ApiCall().showLoaderDialog(context);
          break;
        case Status.COMPLETED:
          print(event.data!.token);
          SharedPrefrence().setToken(event.data!.token!);

          setState(() {
            getDataModel = event.data!;
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IncomingUiPage()),
                  );
                  //IncomingUiPage();
                },
                child: Text("Press the button to go next page")),
            Text(getDataModel.token.toString()),
            Text(getDataModel.tokenType.toString()),
            Text("${getDataModel.expiresIn}"),

            Text("${xyz}"),

            //Text(GetDataModel.token),
          ],
        ),
      ),
    );
  }
}
