import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_project/data/models/user_model.dart';

class AuthController {
  static String? token;
  static UserModel? userModel;

  static const String _tokenKey = 'token';
  static const String _userDataKey = 'user-data';

  static Future<void> saveUserInformation(String accessToken, UserModel user) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_tokenKey, accessToken);
    sharedPreferences.setString(_userDataKey, jsonEncode(user.toJson()));

    token = accessToken;
    userModel = user;
  }

  static Future<void> getUserInformation() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? accessToken = sharedPreferences.getString(_tokenKey);
    String? savedUserModelString = sharedPreferences.getString(_userDataKey);

    if(savedUserModelString != null) {
      UserModel savedUserModel = UserModel.fromJson(jsonDecode(savedUserModelString));
      userModel = savedUserModel;
    }
    token = accessToken;
  }


 static Future<bool> checkIfUserLoggedIn() async {
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   String? userAccessToken = sharedPreferences.getString(_tokenKey);

   if( userAccessToken != null){
    await getUserInformation();
     return true;
   }
   return false;
 }

 static Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    token = null;
    userModel = null;
 }

}