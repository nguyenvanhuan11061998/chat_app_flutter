


import 'package:chat_app_flutter/data/model/chat_room_item/chat_room_model.dart';
import 'package:chat_app_flutter/data/model/user/user_model_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_room_model_dto.g.dart';

@JsonSerializable(
  explicitToJson: true
)
class ChatRoomModelDto implements ChatRoomModel {

  @override
  String? id_room;

  @override
  String? late_message;

  @override
  String? late_time;

  @override
  String? room_name;

  @override
  List<UserModelDto>? list_user;

  ChatRoomModelDto(
      this.id_room, this.late_message, this.late_time, this.list_user, this.room_name);

  factory ChatRoomModelDto.fromJson(Map<String, dynamic> json) => _$ChatRoomModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomModelDtoToJson(this);
}