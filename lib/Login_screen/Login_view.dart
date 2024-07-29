import 'package:flutter/material.dart';
import 'package:fluttertest/Utilis/Utilis.dart';
import 'package:provider/provider.dart';

import '../Utilis/App_colors.dart';
import '../Utilis/Widgets/button.dart';
import '../Utilis/Widgets/textfeilds.dart';
import 'Login_view_model.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
Login_view_model model = Login_view_model();
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<Login_view_model>(
        create: (context) => model,
        child: Consumer<Login_view_model>(
          builder: (context, model, chicld) {
            return model.ischeck
                ? Center(
              child: CircularProgressIndicator(
                color: AppColors.purpleColor,
              ),
            )
                : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: model.username,
                    hintText: "Email",
                    labelText: 'Enter Your Email',
                    prefixIcon: Icons.mail,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: model.password,
                    hintText: 'Password',
                    labelText: 'Enter Your Password',
                    prefixIcon: Icons.lock,
                  ),
                  SizedBox(height: 40),
                  roundbutton(
                    title: 'LOGIN',
                    onpress: () {
                      if (model.username.text.isNotEmpty  && model.password.text.isNotEmpty) {

                        model.login(context);
                        print(model.username.text);
                        print(model.password.text);
                      } else {
                         Utilis.toastmessage("Please enter all fields");
                        print("Email: ${model.username.text}");
                        print("Password: ${model.password.text}");
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
