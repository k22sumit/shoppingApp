import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloudinary/cloudinary.dart';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../constant/global_variables.dart';
import '../../../constant/httpErrorHandling.dart';
import '../../../constant/utils.dart';
import '../../../model/product_model.dart';
import '../../../provider/user_provider.dart';

class SearchService{

  Future<List<Product>?> fetchSearchedProduct(BuildContext context,String query) async {
    List<Product> productList = [];
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res =
      await http.get(Uri.parse('$BASE_URL/api/products/search/$query'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.userModel.token!,
      });

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      snackBar(context, e.toString());
    }
    return productList;
  }

}