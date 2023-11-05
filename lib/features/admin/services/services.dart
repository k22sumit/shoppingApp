import 'dart:convert';

import 'package:amazonclone/constant/global_variables.dart';
import 'package:amazonclone/constant/httpErrorHandling.dart';
import 'package:amazonclone/constant/utils.dart';
import 'package:cloudinary/cloudinary.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../model/product_model.dart';
import '../../../provider/user_provider.dart';
import 'dart:io';

class AdminServices {
  Future<void> sellProduct(
      {required String name,
      required String description,
      required double quantity,
      required List<File> images,
      required String category,
      required double price,
      // required String? id,
      required BuildContext context}) async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      var cloudinary = Cloudinary.unsignedConfig(cloudName: 'dwn3cccug');

      List<String> imageURLs = [];

      for (int i = 0; i < images.length; i++) {
        final cloudinaryResponse = await cloudinary.unsignedUpload(
            uploadPreset: 'hsysjiom', file: images[i].path, folder: name);
        imageURLs.add(cloudinaryResponse.secureUrl.toString());
      }

      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageURLs,
        category: category,
        price: price,
      );

      print(product.toJson());

      http.Response res = await http.post(
        Uri.parse('$BASE_URL/admin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.userModel.token!,
        },
        body: product.toJson(),
      );

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          snackBar(context, 'Product Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    List<Product> productList = [];
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res =
          await http.get(Uri.parse('$BASE_URL/admin/get-all-products'), headers: {
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
