


import 'dart:collection';

import 'package:chat_app_flutter/data/model/room_chat_config/room_config_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/user/user_model.dart';

part 'chat_room_state.freezed.dart';

@freezed
abstract class ChatRoomState with _$ChatRoomState {
  const factory ChatRoomState(RoomConfigModel roomConfigModel, Map<String, UserModel> mapUser) = ChatRoomData;
  const factory ChatRoomState.loading() = ChatRoomLoading;
  const factory ChatRoomState.error(dynamic error) = ChatRoomError;
}