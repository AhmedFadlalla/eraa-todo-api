import 'package:flutter/material.dart';

import '../app_color.dart';
class DefaultBottomWidget extends StatelessWidget {
  double width ;
      Color background ;
  final void Function()? function;
       String text;
  double? fontSize;
    final  bool isUpperCase;
  double radius ;
   DefaultBottomWidget({Key? key,
   this.width=double.infinity,
  this.background=mainColor,
  required this.function,
  this.fontSize,
  this.isUpperCase=true,
  this.radius= 10.0,
  required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: 60.0,
      margin: EdgeInsets.all(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: mainColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
