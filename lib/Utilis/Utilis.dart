import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Utilis {
  static void toastmessage(String message){
    Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        msg: message

    );

  }
  static void success(String message){
    Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        msg: message

    );

  }
  static void submit(String message){
    Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM_LEFT,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        msg: message

    );

  }

}