import 'dart:convert';
import 'package:amazonclone/features/home/screen/userHome_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:amazonclone/constant/httpErrorHandling.dart';
import 'package:amazonclone/constant/utils.dart';
import 'package:amazonclone/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../constant/global_variables.dart';
import '../provider/user_provider.dart';

class AuthServices {
  void signUp({required String email,
    required String name,
    required String password,
    required BuildContext context}) async {
    try {
      UserModel userModel = UserModel(
          name: name,
          email: email,
          password: password,
          sId: '',
          address: '',
          token: '',
          type: '');

      http.Response response = await http.post(
          Uri.parse('${BASE_URL}/api/signUp'),
          body: jsonEncode(userModel.toJson()),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      // httpErrorHandling(
      //     response: response,
      //     context: context,
      //     onSuccess: () {
      //       snackBar(
      //           context, "Account create! Login with same email and password");
      //     });
    } catch (e) {
      snackBar(context, e.toString());
    }
  }

  void signIn({required String email,
    required String password,
    required BuildContext context}) async {
    try {
      http.Response response = await http.post(
          Uri.parse('$BASE_URL/api/signIn'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      print(jsonDecode(response.body)['token']);
      httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () async {
            print(jsonDecode(response.body)['token']);
            var map = jsonDecode(response.body);
            Provider.of<UserProvider>(context, listen: false).setUserModel(map);

            SharedPreferences preferences = await SharedPreferences
                .getInstance();
            await preferences.setString(
                'x-auth-token', jsonDecode(response.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.id, (route) => false);
          });
    } catch (e) {
      snackBar(context, e.toString());
    }
  }

  void getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      print("I am in get function");

      if (token == null) {
        prefs.setString('x-auth-token', '');
        return; // Return early if token is null
      }

      var tokenRes = await http.post(
        Uri.parse('$BASE_URL/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        },
      );

      if(tokenRes.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(tokenRes.body);

        // Access the 'msg' value from the JSON response.
        final bool msgValue = data['msg'];


        if (msgValue == true) {
          http.Response userRes = await http.get(
            Uri.parse('$BASE_URL/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token,
            },
          );
          print("check");

          if(userRes.statusCode == 200){
            print(jsonDecode(userRes.body));

            var userProvider = Provider.of<UserProvider>(context, listen: false);
            userProvider.setUserModel(jsonDecode(userRes.body));
          }
          else{
            print("useRes + ${userRes.statusCode} ");
          }

      }
      }
      else{
        print("tokednRes + ${tokenRes.statusCode}");

      }
    } catch (e) {
      // Handle errors gracefully
      print("Error in getUserData: $e");
      // You can also display a snackbar here if needed.
    }
  }
}
