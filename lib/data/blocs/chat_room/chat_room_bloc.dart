

import 'dart:async';
import 'dart:collection';

import 'package:chat_app_flutter/data/data_source/local_service.dart';
import 'package:chat_app_flutter/data/model/user/user_model.dart';
import 'package:chat_app_flutter/data/repository_imp/room_chat_repository_imp.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../model/image_cache_model.dart';
import '../../model/message/message_model_dto.dart';
import 'chat_room_state.dart';

class ChatRoomBloc extends Cubit<ChatRoomState> {

  final RoomChatRepositoryImp _repositoryImp = GetIt.I.get();
  
  late final String idRoom;
  late final String keyUserId;
  final String keyUser = GetIt.I.get<LocalService>().getKeyUser();
  late List<ImageCacheModel> listImageSelectCache;

  ChatRoomBloc(this.idRoom, this.keyUserId) : super(const ChatRoomState.loading()) {
    initData();
  }

  initData() {
    listImageSelectCache = [];
    _repositoryImp.getConfigRoom(idRoom).then((value) async {
      if (value != null) {
        Map<String, UserModel> mapUser = HashMap();
        List<UserModel> listUser = value.list_user ?? [];
        for (var element in listUser) {
          mapUser.addAll({element.keyUser??'' : element});
        }

        if (value.room_image!.isEmpty) {
          if (value.list_user![0].keyUser == keyUserId) {
            value.room_image = value.list_user![1].avatar ?? '';
          } else {
            value.room_image = value.list_user![0].avatar ?? '';
          }
        }
        if (value.room_name!.isEmpty) {
          if (value.list_user![0].keyUser == keyUserId) {
            value.room_name = value.list_user![1].name ?? '';
          } else {
            value.room_name = value.list_user![0].name ?? '';
          }
        }
        emit(ChatRoomState(value, mapUser));
      } else {
        emit(const ChatRoomState.error('Error null data'));
      }
    }).onError((error, stackTrace) {
      emit(ChatRoomState.error(error));
    });
  }

  Future<bool?> sendMessage(String message, List<String> listImage) async {
    try {
      MessageModelDto messageModel = MessageModelDto(
          idRoom, message, keyUser, DateTime.now(), 'text', []);
      await _repositoryImp.sendMessage(idRoom, messageModel, listImage);
      return true;
    } catch (e) {
      rethrow;
    }
  }

   Query getMessages() {
    return _repositoryImp.getMessages(idRoom);
  }

  /// ===========================================================================

  StreamController listImageSelectCacheController = StreamController<List<ImageCacheModel>>();
  Stream get listImageSelectCacheStream => listImageSelectCacheController.stream;

  Future addImage(List<ImageCacheModel?> images) async {
    for (var element in images) {
      if (element != null && !listImageSelectCache.contains(element)) {
        listImageSelectCache.add(element);
      }
    }
    listImageSelectCacheController.sink.add(listImageSelectCache);
  }

  Future removeImageCache(int index) async {
    listImageSelectCache.removeAt(index);
    listImageSelectCacheController.sink.add(listImageSelectCache);
  }

  Future removeAllImageCache() async {
    listImageSelectCache.clear();
    listImageSelectCacheController.sink.add(listImageSelectCache);
  }

  ///===========================================================================

  StreamController dialogOptionMessController = StreamController<String>();
  Stream get dialogOptionMessStream => dialogOptionMessController.stream;



}