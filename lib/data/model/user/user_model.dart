

import '../chat_room_item/chat_room_model_dto.dart';

abstract class UserModel {
  String? keyUser;
  String? name;
  String? email;
  String? phone;
  String? avatar;
  List<ChatRoomModelDto>? list_chat;
}