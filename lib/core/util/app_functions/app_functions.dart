import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppFunctions{

  static navigateTo({required context, required Widget navigatedWidget})=>
      Navigator.push(
      context, MaterialPageRoute(
      builder: (context)=>navigatedWidget));

  static navigateAndFinishTo({required context, required Widget navigatedWidget})=>
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context)=>navigatedWidget), (route) => false);


  static Future<String> showDatePickerComponent({required context})async{
    final value=await showDatePicker(context: context, initialDate: DateTime.now()
        , firstDate: DateTime.now(), lastDate: DateTime(2050));

    if(value !=null){
      return "${value.year}-${value.month}-${value.day}";
    }else{
      return "";
    }

  }

}