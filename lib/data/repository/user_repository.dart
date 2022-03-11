



import 'package:chat_app_flutter/data/model/user/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getListUser(String userId);

  Future<List<UserModel>> getUsers(String userId);

  Future<UserModel> getUserModel(String keyUserId, bool currentAccount);
}