


import 'dart:io';

import 'package:chat_app_flutter/data/model/message/message_model.dart';
import 'package:chat_app_flutter/data/model/message/message_model_dto.dart';
import 'package:chat_app_flutter/data/model/room_chat_config/room_config_model.dart';
import 'package:chat_app_flutter/data/repository/room_chat_repository.dart';
import 'package:firebase_database/firebase_database.dart' as FirebaseDatabaseQuery;
import 'package:firebase_storage/firebase_storage.dart' as StorageReference;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import '../model/room_chat_config/room_config_dto.dart';
import '../model/user/user_model.dart';
import '../model/user/user_model_dto.dart';

import 'dart:developer' as dev;

class RoomChatRepositoryImp implements RoomChatRepository{
  CollectionReference roomConfig = FirebaseFirestore.instance.collection('room_config');
  CollectionReference roomSearch = FirebaseFirestore.instance.collection('key_search_room');
  CollectionReference users = FirebaseFirestore.instance.collection('chat_database');

  final DatabaseReference _messagesRef = FirebaseDatabase.instance.ref();

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
  Future sendMessage(String idRoom, MessageModelDto message, List<String> listImage) async {
    try {
      List<String> listImageUpload = [];
      if (listImage.isNotEmpty) {
        StorageReference.Reference storageReference = StorageReference
            .FirebaseStorage.instance.ref().child('images_$idRoom');
        List<StorageReference.UploadTask> _uploadTasks = [];
        for (var element in listImage) {
          File file = File(element);
          StorageReference.UploadTask uploadTask = storageReference.child(
              '/img_${DateTime.now()}_${file.path
                  .split('/')
                  .last}').putFile(file);
          _uploadTasks.add(uploadTask);
        }
        for (var element in _uploadTasks) {
          StorageReference.TaskSnapshot taskSnapshot = await Future.value(
              element);
          await taskSnapshot.ref.getDownloadURL().then((value) {
            listImageUpload.add(value);
          });
        }
      }
      message.images = listImageUpload;
      return _messagesRef.child('message_room_$idRoom').push().set(
          message.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  FirebaseDatabaseQuery.Query getMessages(String idRoom) {
    return _messagesRef.child('message_room_$idRoom');
  }

  @override
  Future<String> searchRoom(String keyUser, String keySearch) async {
    try {
      final result = await roomSearch.where('key_room', isEqualTo: keySearch).where('key_member', isEqualTo: keyUser).get();
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

      RoomConfigDto roomConfigModel = RoomConfigDto([userModel as UserModelDto, user as UserModelDto],  '', '');

      Map <String, dynamic> dataJson = roomConfigModel.toJson();

      final addRoomResult = await roomConfig.add(dataJson);
      await roomSearch.add({
        'key_member': myUser.keyUser,
        'id_room': addRoomResult.id,
        'key_room': user.email
      });
      await roomSearch.add({
        'key_member': user.keyUser,
        'id_room': addRoomResult.id,
        'key_room': user.email
      });
      addRoomChatDatabaseUser(userModel, addRoomResult.id, user);
      return addRoomResult.id;
    } catch (err) {
      rethrow;
    }
  }

  void addRoomChatDatabaseUser(UserModel userModel, String idRoom, UserModel user) {
    users.where('keyUser', isEqualTo: userModel.keyUser).get().then((value) {
      if ((value.docs.first.data() as Map<String, dynamic>)['list_chat'] == null) {
        value.docs[0].reference.set({'list_chat': [idRoom]}, SetOptions(merge: true));
      } else {
        value.docs[0].reference.update({
          'list_chat': FieldValue.arrayUnion(
              [idRoom])
        });
      }
    });
    users.where('keyUser', isEqualTo: user.keyUser).get().then((value) {
      if ((value.docs.first.data() as Map<String, dynamic>)['list_chat'] == null) {
        value.docs[0].reference.set({'list_chat': [idRoom]}, SetOptions(merge: true));
      } else {
        value.docs[0].reference.update({
          'list_chat': FieldValue.arrayUnion(
              [idRoom])
        });
      }
    });
  }

  @override
  Future<MessageModel> getLatestMessage(String id_room) async {
    try {
      final data = await _messagesRef.child('message_room_$id_room').orderByKey().limitToLast(1).once();
      MessageModelDto message = MessageModelDto.fromJson(Map<String, dynamic>.from((data.snapshot.value as Map).values.toList()[0] as Map));
      return message;
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future updateLateMessage(String keyUser, String message) async {
  //   return null
  // }


}