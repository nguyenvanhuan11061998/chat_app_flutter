

import 'package:chat_app_flutter/data/model/message/message_model.dart';
import 'package:firebase_database/firebase_database.dart';

import '../model/message/message_model_dto.dart';
import '../model/room_chat_config/room_config_model.dart';
import '../model/user/user_model.dart';

abstract class RoomChatRepository {
  Future<RoomConfigModel?> getConfigRoom(String idRoom);

  Future sendMessage(String idRoom, MessageModelDto message, List<String> listImage);

  // Future updateLateMessage(String message);

  Query getMessages(String idRoom);

  Future<String> searchRoom(String keyUser, String keySearch);

  Future<dynamic> findUser(String keySearch);

  Future createNewRoomChat(UserModel userModel, UserModel user);

  Future<MessageModel> getLatestMessage(String id_room);
}