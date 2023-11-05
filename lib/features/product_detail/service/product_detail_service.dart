import 'dart:convert';
import 'package:amazonclone/constant/httpErrorHandling.dart';
import 'package:amazonclone/constant/utils.dart';
import 'package:amazonclone/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../constant/global_variables.dart';
import '../../../model/product_model.dart';
import '../../../provider/user_provider.dart';

class ProductDetailsServices {

  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$BASE_URL/api/add-to-cart'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.userModel.token!,
        },
        body: jsonEncode({
          'id': product.id!,

        }),
      );

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          UserModel user =
          userProvider.userModel.copyWith(cart: jsonDecode(res.body)['cart']);
          userProvider.setUserModel(user.toJson());
        },
      );
    } catch (e) {
      snackBar(context, e.toString());
    }
  }

  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$BASE_URL/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.userModel.token!,
        },
        body: jsonEncode({
          'id': product.id!,
          'rating': rating,
        }),
      );

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {},
      );
    } catch (e) {
      snackBar(context, e.toString());
    }
  }
}
