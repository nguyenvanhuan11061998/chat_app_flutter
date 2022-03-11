



import 'dart:convert';

import 'package:chat_app_flutter/data/repository/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';

import '../data_source/local_service.dart';
import '../model/user/user_model.dart';
import '../model/user/user_model_dto.dart';

class UserRepositoryImp implements UserRepository {

  CollectionReference users = FirebaseFirestore.instance.collection('chat_database');

  @override
  Future<List<UserModel>> getListUser(String userId) async {
    final dataUser = jsonDecode(getDataConfig());
    List<UserModel> listUser = (dataUser['users'] as List<dynamic>).map((e) => UserModelDto.fromJson(e)).toList();
    return listUser;
  }

  @override
  Future<List<UserModel>> getUsers(String userId) async {
    final dataUser = jsonDecode(getDataConfig());
    List<UserModel> users = (dataUser['users'] as List<dynamic>).map((e) => UserModelDto.fromJson(e)).toList();
    return users;
  }

  String getDataConfig() {
    String data = '';
    FirebaseRemoteConfig firebaseRemoteConfig = FirebaseRemoteConfig.instance;
    data = firebaseRemoteConfig.getString('list_user');
    return data;
  }

  @override
  Future<UserModel> getUserModel(String keyUserId, bool currentAccount) async {
    try {
      final data = await users.where('keyUser', isEqualTo: keyUserId).get();
      UserModel userModel = UserModelDto.fromJson(
          data.docs.first.data() as Map<String, dynamic>);
      if (currentAccount) {
        GetIt.I.get<LocalService>().saveUserModel(jsonEncode(data.docs.first.data() as Map<String, dynamic>));
      }
      return userModel;
    } catch (e) {
      rethrow;
    }
  }

}