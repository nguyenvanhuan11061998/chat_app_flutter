

import 'package:chat_app_flutter/data/data_source/local_service.dart';
import 'package:chat_app_flutter/data/repository_imp/room_chat_repository_imp.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../model/message/message_model_dto.dart';
import 'chat_room_state.dart';

class ChatRoomBloc extends Cubit<ChatRoomState> {

  final RoomChatRepositoryImp _repositoryImp = GetIt.I.get();
  late final String idRoom;
  final String keyUser = GetIt.I.get<LocalService>().getKeyUser();

  ChatRoomBloc(this.idRoom) : super(const ChatRoomState.loading()) {
    initData();
  }

  initData() {
    _repositoryImp.getConfigRoom(idRoom).then((value) {
      if (value != null) {
        emit(ChatRoomState(value));
      } else {
        emit(const ChatRoomState.error('Error null data'));
      }
    }).onError((error, stackTrace) {
      emit(ChatRoomState.error(error));
    });
  }

  Future sendMessage(String message) async {
    try {
      MessageModelDto messageModel = MessageModelDto(
          idRoom, message, keyUser, DateTime.now(), 'text');
      final result = await _repositoryImp.sendMessage(messageModel);
    } catch (e) {

    }
  }

   Query getMessages() {
    return _repositoryImp.getMessages(idRoom);
  }

}