import 'package:flutter/material.dart';

import 'get_incoming _post/ui/incoming_ui.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'sample/ui/getapiuipage.dart';

SharedPreferences? sharedPrefrence;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefrence = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetApiUiPage(),
    );
  }
}
