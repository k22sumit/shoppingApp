import 'package:amazonclone/constant/global_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:5,bottom: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      child: RichText(text: TextSpan(

        text: "Hello, ",
        style: TextStyle(
          fontSize: 22,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: "UserName",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,

          )
          )
        ]
      ),
      ),
    );
  }
}
