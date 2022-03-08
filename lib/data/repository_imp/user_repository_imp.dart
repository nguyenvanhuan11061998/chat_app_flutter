



import 'dart:convert';

import 'package:chat_app_flutter/data/repository/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

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
    final dataUser = jsonDecode(getDataConfig() as String);
    List<UserModel> users = (dataUser['users'] as List<dynamic>).map((e) => UserModelDto.fromJson(e)).toList();
    return users;
  }

  String getDataConfig() {
    String data = '';
    FirebaseRemoteConfig firebaseRemoteConfig = FirebaseRemoteConfig.instance;
    data = firebaseRemoteConfig.getString('list_user');
    return data;
  }

  Future getUserModel(String keyUserId) {
    return users.where('keyUser', isEqualTo: keyUserId).get();
  }

}