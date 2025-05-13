import 'package:task_manager_project/data/models/user_model.dart';

class LoginModel {
  late final String status;
  late final String token;
  late final UserModel userModel;

  LoginModel.fromJson(Map<String, dynamic> json){
    status = json['json'] ?? '';
    userModel = UserModel.fromJson(json['data'] ?? {} );
    token = json['token'] ?? '';
  }
}