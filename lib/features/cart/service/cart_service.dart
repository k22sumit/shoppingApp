
import 'dart:convert';

import 'package:amazonclone/constant/global_variables.dart';
import 'package:amazonclone/constant/httpErrorHandling.dart';
import 'package:amazonclone/constant/utils.dart';
import 'package:amazonclone/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../model/product_model.dart';
import '../../../provider/user_provider.dart';

class CartServices {
  void removeFromCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.delete(
        Uri.parse('$BASE_URL/api/remove-from-cart/${product.id}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.userModel.token!,
        },
      );

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          UserModel user =
          userProvider.userModel.copyWith(cart: jsonDecode(res.body)['cart']);
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      snackBar(context, e.toString());
    }
  }
}