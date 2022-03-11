


import 'package:chat_app_flutter/data/model/user/user_model.dart';

import '../user/user_model_dto.dart';

abstract class RoomConfigModel {
  String? get id_room;
  String? get room_name;
  List<UserModel>? get list_user;
}