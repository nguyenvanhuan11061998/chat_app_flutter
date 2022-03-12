



import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:chat_app_flutter/data/model/room_chat_config/room_config_model.dart';
import 'package:chat_app_flutter/data/model/user/user_model_dto.dart';
part 'room_config_dto.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class RoomConfigDto implements RoomConfigModel {

  @override
  List<UserModelDto>? list_user;

  @override
  String? room_name;

  @override
  String? room_image;

  RoomConfigDto(this.list_user, this.room_name, this.room_image);

  factory RoomConfigDto.fromJson(Map<String, dynamic> json) {
    return _$RoomConfigDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RoomConfigDtoToJson(this);

}