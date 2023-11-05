import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const AccountButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.black38.withOpacity(0.03),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(fontSize: 18),
          )),
    );
  }
}
