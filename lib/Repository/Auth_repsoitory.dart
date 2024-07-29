import 'dart:convert';

import '../Data/network/App_url.dart';
import '../Data/network/Base_api_services.dart';
import '../Data/network/Network_api_services.dart';
import '../Data/response/api_response.dart';
import '../Models/Auth_model.dart';

class login_repository {

  BaseApiservices apiservices=Network_APi_services();

  Future<AuthResponse> getlogin(String username, String passsword) async {
    Map body = {
      'userName': username,
      'password': passsword,
    };
    dynamic resposne = await apiservices.postapiResponse(Appurl.loginurl,body);
    return AuthResponse.fromJson(resposne);
  }


}