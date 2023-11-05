import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  const SingleProduct({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),

      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.black12,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(5),
        
      ),
      child: Container(
        width: 180,
        child: Image.network(image,fit: BoxFit.fill,
        width: 180,),
      ),
    );
  }
}
