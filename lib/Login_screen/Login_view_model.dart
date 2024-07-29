import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertest/Home_screen/Home_sreen_view.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import '../Repository/Auth_repsoitory.dart';
import '../Services/Shared_prefrence.dart';
import '../Utilis/Utilis.dart';

class Login_view_model with ChangeNotifier {
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();
  Sharedprefrence sp= Sharedprefrence();

  bool _ischeck=false;
  bool get ischeck =>_ischeck;
  void set(bool value){
    _ischeck=value;
    notifyListeners();
  }
 final login_res =login_repository();

void clear() {
  username.clear();
  password.clear();
}

Future<void> login(BuildContext context) async {
try {
  set(true);

  var newsResponse =  await login_res.getlogin(username.text.toString(),password.text.toString());
  if(newsResponse.statusCode=="OK"){
    set(false);
    clear();
    await sp.storedata(newsResponse);
    Utilis.success("You are Sucessfully Login");
    Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
  }

}
catch(e){
  set(false);
  Utilis.toastmessage("Something went wrong please try again later");
}
}

}