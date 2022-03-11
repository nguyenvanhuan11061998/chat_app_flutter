


import 'dart:convert';

import 'package:chat_app_flutter/data/model/user/user_model.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user/user_model_dto.dart';

class LocalService {

  final String keyUser = "key_user_id";
  final String keyPassword = 'key_password';
  final String keyUserModel = "key_user_model";

  final SharedPreferences _sharedPreferences = GetIt.instance.get();

  String getKeyUser() {
    return _sharedPreferences.getString(keyUser) ?? '';
  }

  Future saveKeyUser(String kUser) {
    return _sharedPreferences.setString(keyUser, kUser);
  }

  Future saveUserModel(String json) {
    return _sharedPreferences.setString(keyUserModel, json);
  }

  UserModel? getUserModel() {
    if (_sharedPreferences.getString(keyUserModel) == null) {
      return null;
    }
    final dataUser = jsonDecode(_sharedPreferences.getString(keyUserModel)!);
    UserModel userModel = UserModelDto.fromJson(dataUser);
    return userModel;
  }

  Future savePassword(String password) {
    return _sharedPreferences.setString(keyPassword, password);
  }

  String getPassword() {
    return _sharedPreferences.getString(keyPassword) ?? '';
  }

}