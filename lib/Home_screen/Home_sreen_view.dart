import 'package:flutter/material.dart';
import 'package:fluttertest/Login_screen/Login_view.dart';
import 'package:fluttertest/Utilis/Utilis.dart';


import '../Services/Shared_prefrence.dart';
import '../Utilis/App_colors.dart'; // Update with your actual import path

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _HomeState();
}

class _HomeState extends State<home> {
  Sharedprefrence sp = Sharedprefrence();

  // Method to handle logout
  Future<void> logout() async {
    await sp.delete(); // Clear all data from SharedPreferences

    // Navigate to the login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
    Utilis.toastmessage("You are Logout");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purpleColor, // Ensure AppColors.purpleColor is defined
        title: Text('Home Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout), // Logout icon
            onPressed: () {
              logout(); // Call logout method when button is pressed
            },
            tooltip: 'Logout', // Optional tooltip
          ),
          SizedBox(width: 16), // Adds space between the button and the edge of the AppBar
        ],
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}
