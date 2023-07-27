import 'package:flutter/material.dart';

import '../app_color.dart';
class FormFieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final void Function(String)? onSubmit;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final void Function()? prefixTapFunction;
  final void Function()? suffixIconTapFunction;
  final String? Function(String?)? validator;
  final bool  isPassword;
  IconData? iconWidget;
  String? label;
       IconData? prefixIcon;
  IconData? suffixIcon;
  Color? labelColor;
   FormFieldComponent({Key? key,
  required this.controller,
  required this.keyboardType,
    required this.validator,
     this.labelColor,
   this.onSubmit,
   this.onTap,
   this.prefixTapFunction,
   this.suffixIconTapFunction,
   this.onChange,
    this.iconWidget,
    this.isPassword=false,
    this.suffixIcon,
    this.label,
    this.prefixIcon


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validator,
      obscureText: isPassword,
      onTap: onTap,

      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
          labelText: label,
          // label: Text(label??"",style: TextStyle(fontSize: 14,
          // color: Colors.black),),
          hintStyle: const TextStyle(color: Colors.black),
          labelStyle:  TextStyle(color: labelColor??Colors.black),
          prefixIcon: InkWell(
            onTap: prefixTapFunction,
            child: Icon(
              prefixIcon,
            ),
          ),
          suffixIcon: IconButton(
              onPressed: suffixIconTapFunction,
              icon: Icon(
                suffixIcon,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: mainColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: mainColor,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: Colors.white,
              ))),
    );
  }
}
