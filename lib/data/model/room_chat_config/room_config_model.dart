


import 'package:chat_app_flutter/data/model/user/user_model.dart';

import '../user/user_model_dto.dart';

abstract class RoomConfigModel {
  String? get room_name;
  String? get room_image;
  List<String>? get list_user;
}