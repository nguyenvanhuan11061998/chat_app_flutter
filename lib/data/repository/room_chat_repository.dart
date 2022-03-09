

import 'package:firebase_database/firebase_database.dart';

import '../model/message/message_model_dto.dart';
import '../model/room_chat_config/room_config_model.dart';

abstract class RoomChatRepository {
  Future<RoomConfigModel?> getConfigRoom(String idRoom);

  Future sendMessage(MessageModelDto message);

  Query getMessages(String idRoom);
}