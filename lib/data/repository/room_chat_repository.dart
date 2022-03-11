

import 'package:firebase_database/firebase_database.dart';

import '../model/message/message_model_dto.dart';
import '../model/room_chat_config/room_config_model.dart';
import '../model/user/user_model.dart';

abstract class RoomChatRepository {
  Future<RoomConfigModel?> getConfigRoom(String idRoom);

  Future sendMessage(String idRoom, MessageModelDto message);

  Query getMessages(String idRoom);

  Future<String> searchRoom(String keySearch);

  Future<dynamic> findUser(String keySearch);

  Future createNewRoomChat(UserModel userModel, UserModel user);
}