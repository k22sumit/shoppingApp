import 'dart:convert';

import 'package:amazonclone/constant/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

void httpErrorHandling(
    {required Response response,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      snackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      snackBar(context, jsonDecode(response.body)['error']);
      break;

    default:
      snackBar(context, response.body);
  }
}
