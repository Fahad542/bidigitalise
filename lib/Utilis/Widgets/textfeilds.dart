import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:fluttertest/Utilis/App_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
   FocusNode? focusNode;
  final String hintText;
  final String labelText;
  final IconData prefixIcon;
   Widget? suffixIcon; // Change the type to Widget
  final ValueChanged<String>? onChanged;

  CustomTextField({
    required this.controller,
     this.focusNode,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
     this.suffixIcon,
    this.onChanged,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true; // Manage the password visibility here

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        controller: widget.controller,
           decoration: InputDecoration(hintText: widget.hintText,
             prefixIcon: Icon(widget.prefixIcon,color: AppColors.purpleColor,
             ),
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
             focusedBorder: OutlineInputBorder(
               borderSide: BorderSide(color: AppColors.purpleColor, width: 1.0),
               borderRadius: BorderRadius.circular(10),
             ),
           ),
       ),
    );
  }
}




class PasswordVisibilityToggle extends StatefulWidget {
  final ValueNotifier<bool> obscureTextNotifier;

  PasswordVisibilityToggle({required this.obscureTextNotifier});

  @override
  _PasswordVisibilityToggleState createState() =>
      _PasswordVisibilityToggleState();
}

class _PasswordVisibilityToggleState extends State<PasswordVisibilityToggle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.obscureTextNotifier.value = !widget.obscureTextNotifier.value;
      },
      child: Icon(
        widget.obscureTextNotifier.value
            ? Icons.visibility
            : Icons.visibility_off_outlined,
      ),
    );
  }
}