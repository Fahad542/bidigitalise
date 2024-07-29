


import 'package:fluttertest/Data/response/status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;


  ApiResponse(this.data, this.message, this.status);
  ApiResponse.loading() : status =Status.LOADING;
  ApiResponse.complete(this.data) : status =Status.COMPLETED;
  ApiResponse.error(this.message) : status =Status.ERROR;

  @override
  String toString(){
    return "$Status: $status\n Message: $message \n Data: $data";
  }
}