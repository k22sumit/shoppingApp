import 'package:amazonclone/features/search/widget/start.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/product_model.dart';
import '../../product_detail/screen/product_screen.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;

  const SearchedProduct({super.key, required this.product});



  @override
  Widget build(BuildContext context) {

    void navigateToProductDetails(){
      Navigator.pushNamed(context, ProductDetailScreen.routeName,arguments: product);
    }


    return InkWell(
      onTap:navigateToProductDetails,
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Image.network(
                  product.images[0],
                  fit: BoxFit.fitHeight,
                  width: 135,
                  height: 135,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 220,
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          product.name,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        width: 220,
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          product.description,
                          style: TextStyle(fontSize: 16),
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        width: 220,
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          product.name,
                          style: TextStyle(fontSize: 16),
                          maxLines: 2,
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 5, left: 10),
                          width: 220,
                          child: Stars(rating: 4)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
