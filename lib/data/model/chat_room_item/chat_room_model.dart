


import 'package:chat_app_flutter/data/model/user/user_model.dart';

import '../user/user_model_dto.dart';

abstract class ChatRoomModel {
  String? id_room;
  String? room_name;
  List<String>? list_user;
  String? late_message;
  String? late_time;
  String? room_image;
}