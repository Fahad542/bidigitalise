import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/Models/Shared_model.dart';
import 'package:fluttertest/Utilis/App_colors.dart';


import '../Home_screen/Home_sreen_view.dart';
import '../Login_screen/Login_view.dart';
import '../Services/Shared_prefrence.dart';

import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Sharedprefrence sp = Sharedprefrence();

  @override
  void initState() {
    super.initState();
    checkauth();
  }

  Future<void> checkauth() async {
    Sharedmodel auth = await sp.getdata();
    if (auth.accessToken != null && auth.expiryDate != null) {
      if (DateTime.now().isBefore(auth.expiryDate!)) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => home()), // Ensure 'Home' is capitalized correctly
          );
          print('Current time: ${DateTime.now()}');
          print("Token: ${auth.accessToken}");
          print("Expiry Date: ${auth.expiryDate}");
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()), // Ensure 'Login' is capitalized correctly
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()), // Ensure 'Login' is capitalized correctly
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: CircularProgressIndicator(color: AppColors.purpleColor,), // Optional: Display a loading indicator
      ),
    );
  }
}
