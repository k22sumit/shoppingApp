import 'package:amazonclone/model/user_model.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{

  UserModel _userModel = UserModel(sId: '', name: '', password: '', email: '', address: '',  type: '',token:'',cart: [] );

  UserModel get userModel => _userModel;

  void setUserModel(Map<String,dynamic> user){
    _userModel = UserModel.fromJson(user);
    notifyListeners();
  }


  void setUserFromModel(UserModel user) {
    _userModel = user;
    notifyListeners();
  }
  
}