import 'package:amazonclone/constant/global_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Function() onPress;

  const CustomButton({required this.text,super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: GlobalVariables.secondaryColor,
        onPressed:onPress , child: Text(text),
    );
  }
}
