import 'dart:convert';
import 'dart:developer';
import 'dart:io';
//import 'package:http/http.dart ' as http;
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../sharedpreference/shared_preference.dart';
import 'custom_exception.dart';

class BaseHttp {
  Future<dynamic> get(String url1) async {
    // Map<String, String> requestHeaders = {'Authorization': ''};

    //log("Get[BASE_HTTP] -> $url1");
    var responseJson;
    try {
      var url = Uri.parse(url1);
      final response = await http.get(
        url,
      );
      //log("Body -> ${response.body}  Code -> ${response.statusCode}");
      if (response.statusCode == 401) {
        //log("GOT 401 ERROR");
        //var newToken = await refreshToken();
        //requestHeaders['Authorization'] = 'Bearer $token';
        responseJson = _response(await http.get(url));
      } else
        responseJson = _response(response);
      log("response of request${responseJson}");
    } catch (e) {
      /*on SocketException {*/
      log("exception"+e.toString());
      print("${e}");
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postWithBody2(String url1, dynamic body) async {
    log("$url1 $body");
    var responseJson;
    try {
      //For Testing
      // var expToken =
      //     "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODUwMTYwNjYsImlzcyI6IlRlc3QuY29tIiwiYXVkIjoiVGVzdC5jb20ifQ.wOFqNzzLSdGCh6poFnwqLok5e5AB3S27IJkrE7of2u0";
       var token = SharedPrefrence().getToken();
      // log("$token");
      Map<String, String> requestHeaders = {
        "Accept": "application/json",
        "content-type": "application/json",
        /*"content-type":"application/json",*/
      //  'Authorization': 'Bearer $token'
        'Authorization': 'Bearer $token'
      };
      // if(BHRHSharedPrefrence().hasRefreshToken())
      //   requestHeaders['Authorization'] = 'Bearer $expToken';
      // log(requestHeaders.toString());
      var url = Uri.parse(url1);
      print("${url},, ${body}");

      final response =
          await http.post(url, body: body,headers: requestHeaders);

      log(response.statusCode.toString());
      if (response.statusCode == 401) {
        log("GOT 401 ERROR");
        //var newToken = await refreshToken();
       // requestHeaders['Authorization'] = 'Bearer $newToken';
        //log("venki ${requestHeaders}");
        responseJson = _response(
            await http.post(url, body: body,));
      } else
        responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getwithparameters(String url, body) async {
    log("url..$body $url");
    var responseJson;
    try {
      var urlencoded = Uri.parse(url);
      print("before///${urlencoded}");
      urlencoded = urlencoded.replace(queryParameters: body);
      print("After...///${urlencoded}");
      print(urlencoded);
      final response = await http.get(urlencoded);
      // http.StreamedResponse response = await request.send();
      if (response.statusCode == 401) {
        var urlencoded = Uri.parse(url);

        urlencoded = urlencoded.replace(queryParameters: body);

        responseJson = _response(response);
      } else
        responseJson = _response(response);
    } catch (e) {
      print("Error: ${e.toString()}");
    }
    /*}*/
    return responseJson;
  }

  // Future<dynamic> getWithqueryparameters(
  //     String url1, Map<String, dynamic> body) async {
  //   log("$body $url1");

  //   var responseJson;

  //   try {
  //     var urlencoded = Uri.https( url1, body as String);

  //     print("urlencoded: $urlencoded");

  //     final response = await http.get(urlencoded);

  //     if (response.statusCode == 401) {
  //       var urlencoded = Uri.https( url1, body as String);

  //       responseJson = _response(await http.get(urlencoded));
  //     } else
  //       responseJson = _response(response);
  //   } catch (e) {
  //     print("Error: ${e.toString()}");
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }

  dynamic _response(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        // if (response.body.toString().toLowerCase() == "success") {
        //   return response.body.toString();
        // } else {
        //   var responseJson = json.decode(response.body.toString());
        //   print(responseJson);
        //   return responseJson;
        // }

        //var responseJson = json.decode(response.body.toString());
       var responseJson = response.body;
        print("responseBody....${responseJson}");
        return responseJson;
      case 400:
        throw BadRequestException(json.decode(response.body.toString()));
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw FetchDataException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
