


import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user/user_model.dart';
import '../model/user/user_model_dto.dart';
import '../repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('chat_database');

  @override
  Future login(String email, String pass) async {
    return _auth.signInWithEmailAndPassword(email: email, password: pass);
  }

  @override
  Future createAccount(String email, String password) async {
    return _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future signOut() async {
    await _auth.signOut();
  }

  @override
  Future createUserModel(String keyUserId, String name, String email) {
    UserModel userModel = UserModelDto.copyWith(keyUserId, name, email);
    return users.add((userModel as UserModelDto).toJson());
  }

}