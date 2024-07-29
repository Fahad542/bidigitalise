import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../App_colors.dart';


class roundbutton extends StatefulWidget {

  final String title;
  final bool loading;
  final VoidCallback onpress;
  const roundbutton({super.key, required this.title, this.loading=false, required this.onpress});

  @override
  State<roundbutton> createState() => _roundbuttonState();
}

class _roundbuttonState extends State<roundbutton> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onpress,
      child: Container(
          decoration: BoxDecoration(color: AppColors.purpleColor,
              borderRadius: BorderRadius.circular(10)
          ),
          height: 40,
          width: 130,
          child: Center(
            child: widget.loading ? CircularProgressIndicator(color: Colors.white,): Text(widget.title, style: TextStyle(color: Colors.white,  fontSize: 18),),
          )
      ),
    );
  }
}
