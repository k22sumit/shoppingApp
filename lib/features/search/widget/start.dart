import 'package:amazonclone/constant/global_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Stars extends StatelessWidget {
  final  double rating;
  const Stars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        itemCount: 5,
        itemSize: 15,
        rating: rating,
        direction: Axis.horizontal,

        itemBuilder: (context,_) =>
      Icon(Icons.star,color: GlobalVariables.secondaryColor,)
    );
  }
}
