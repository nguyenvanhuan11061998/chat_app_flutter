


import 'package:chat_app_flutter/data/model/chat_room_item/chat_room_model.dart';
import 'package:chat_app_flutter/data/model/message/message_model_dto.dart';
import 'package:chat_app_flutter/data/model/room_chat_config/room_config_model.dart';
import 'package:chat_app_flutter/data/repository/room_chat_repository.dart';
import 'package:firebase_database/firebase_database.dart' as FirebaseDatabaseQuery;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import '../model/chat_room_item/chat_room_model_dto.dart';
import '../model/room_chat_config/room_config_dto.dart';
import '../model/user/user_model.dart';
import '../model/user/user_model_dto.dart';

import 'dart:developer' as dev;

class RoomChatRepositoryImp implements RoomChatRepository{
  CollectionReference roomConfig = FirebaseFirestore.instance.collection('room_config');
  CollectionReference roomSearch = FirebaseFirestore.instance.collection('key_search_room');
  CollectionReference users = FirebaseFirestore.instance.collection('chat_database');

  final DatabaseReference _messagesRef = FirebaseDatabase.instance.ref().child('messages');

  @override
  Future<RoomConfigModel?> getConfigRoom(String idRoom) async {
    try {
      RoomConfigModel? roomConfigModel;
      final data = await roomConfig.doc(idRoom).get();
      roomConfigModel = RoomConfigDto.fromJson(data.data() as Map<String, dynamic>);
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

  @override
  Future<String> searchRoom(String keySearch) async {
    try {
      final result = await roomSearch.where('key_room', isEqualTo: keySearch).get();
      if (result.docs.isNotEmpty) {
        return (result.docs.first.data() as Map<String, dynamic>)['id_room'];
      } else {
        return '';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> findUser(String keySearch) async {
    final dataUser = await users.where('email', isEqualTo: keySearch).get();
    if (dataUser.docs.isEmpty) {
      return null;
    } else {
      UserModel data = UserModelDto.fromJson(dataUser.docs.first.data() as Map<String, dynamic>);
      UserModel userModel = UserModelDto.copyWith2(data.keyUser, data.email, data.name, data.avatar);
      return userModel;
    }
  }

  @override
  Future createNewRoomChat(UserModel myUser, UserModel user) async {
    try {
      UserModel userModel = UserModelDto(
          myUser.keyUser, myUser.email, myUser.name, '', myUser.avatar, null);

      RoomConfigDto roomConfigModel = RoomConfigDto(
          '', [userModel as UserModelDto, user as UserModelDto], user.name);

      Map <String, dynamic> dataJson = roomConfigModel.toJson();

      final addRoomResult = await roomConfig.add(dataJson);
      await roomSearch.add({
        'id_room': addRoomResult.id,
        'key_room': user.email
      });
      updateChatDatabaseUser(userModel, addRoomResult.id, user);
      return addRoomResult.id;
    } catch (err) {
      rethrow;
    }
  }

  void updateChatDatabaseUser(UserModel userModel, String idRoom, UserModel user) {
    ChatRoomModel chatRoomModel = ChatRoomModelDto(idRoom, null, null, [userModel as UserModelDto, user as UserModelDto], user.name);
    users.where('keyUser', isEqualTo: userModel.keyUser).get().then((value) {
      if ((value.docs.first.data() as Map<String, dynamic>)['list_chat'] == null) {
        value.docs[0].reference.set({'list_chat': [(chatRoomModel as ChatRoomModelDto).toJson()]}, SetOptions(merge: true));
      } else {
        value.docs[0].reference.update({
          'list_chat': FieldValue.arrayUnion(
              [(chatRoomModel as ChatRoomModelDto).toJson()])
        });
      }
    });
    users.where('keyUser', isEqualTo: user.keyUser).get().then((value) {
      if ((value.docs.first.data() as Map<String, dynamic>)['list_chat'] == null) {
        value.docs[0].reference.set({'list_chat': [(chatRoomModel as ChatRoomModelDto).toJson()]}, SetOptions(merge: true));
      } else {
        value.docs[0].reference.update({
          'list_chat': FieldValue.arrayUnion(
              [(chatRoomModel as ChatRoomModelDto).toJson()])
        });
      }
    });
  }
}