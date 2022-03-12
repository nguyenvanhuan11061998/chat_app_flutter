


import 'package:chat_app_flutter/data/model/user/user_model.dart';

import '../user/user_model_dto.dart';

abstract class RoomConfigModel {
  String? room_name;
  String? room_image;
  List<UserModel>? get list_user;
}