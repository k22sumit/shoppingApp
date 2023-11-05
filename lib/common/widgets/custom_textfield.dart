import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
final int maxLine;
  const CustomTextField({super.key,required this.controller,required this.hint,  this.maxLine = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black
          )
        ),

      ),
      validator: (val){
        if(val == null || val.isEmpty){
          return "Enter you $hint";
        }
        return null;
      },
    );
  }
}
