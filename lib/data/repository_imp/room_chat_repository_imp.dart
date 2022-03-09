


import 'package:chat_app_flutter/data/model/message/message_model_dto.dart';
import 'package:chat_app_flutter/data/model/room_chat_config/room_config_model.dart';
import 'package:chat_app_flutter/data/repository/room_chat_repository.dart';
import 'package:firebase_database/firebase_database.dart' as FirebaseDatabaseQuery;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import '../model/room_chat_config/room_config_dto.dart';

class RoomChatRepositoryImp implements RoomChatRepository{
  CollectionReference roomConfig = FirebaseFirestore.instance.collection('room_config');

  final DatabaseReference _messagesRef = FirebaseDatabase.instance.ref().child('messages');

  @override
  Future<RoomConfigModel?> getConfigRoom(String idRoom) async {
    try {
      RoomConfigModel? roomConfigModel;
      final data = await roomConfig.where("id_room", isEqualTo: idRoom).get();
      roomConfigModel = RoomConfigDto.fromJson(data.docs.first.data() as Map<String, dynamic>);
      return roomConfigModel;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future sendMessage(MessageModelDto message) {
    return _messagesRef.push().set(message.toJson());
  }

  @override
  FirebaseDatabaseQuery.Query getMessages(String idRoom) {
    return _messagesRef.orderByChild('id_room').equalTo(idRoom);
  }
}