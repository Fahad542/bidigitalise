import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../app_expections.dart';
import 'Base_api_services.dart';

class Network_APi_services extends BaseApiservices{
  @override
  Future getapiResponse(String url) async {
  dynamic responsedata;
    try {
      final response = await http.get(Uri.parse(url));
      responsedata=returnResponse(response);
      print(responsedata);
    }
       catch(e) {
       FetchDataExpections("No Internet Connection");
        }
    return responsedata;
  }

  @override
  Future postapiResponse(String url, dynamic data) async {
    dynamic responsedata;
    final headers = {
      'accept': 'text/plain',
      'BD-Tenant-Id': 'bedigitalise',
      'Content-Type': 'application/json',
    };
    try {
      Response response = await http.post(Uri.parse(url),
         body:   jsonEncode(data)  ,
         headers: headers
      );
      responsedata=returnResponse(response);
    }
    on SocketException {
      throw FetchDataExpections("No Internet Connection ");
    }
   return responsedata;
  }

  dynamic returnResponse (http.Response response){
    switch(response.statusCode){
      case 200:
          dynamic resposnejson =jsonDecode(response.body);
          print(response.statusCode);
          return resposnejson;
      case 400:
        print(response.statusCode);
        throw BadRequestExpections(response.body.toString());
      case 404:
        print(response.statusCode);
        throw UnauthorisedExpections(response.body.toString());

      default:
        print(response.statusCode);
        throw FetchDataExpections("Error occured while communicating with server"+"with status code "+"${response.statusCode.toString()}");
    }
  }
}