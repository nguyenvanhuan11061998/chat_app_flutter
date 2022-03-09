



import 'package:json_annotation/json_annotation.dart';
import 'package:chat_app_flutter/data/model/room_chat_config/room_config_model.dart';
import 'package:chat_app_flutter/data/model/user/user_model_dto.dart';
part 'room_config_dto.g.dart';

@JsonSerializable()
class RoomConfigDto implements RoomConfigModel {

  @override
  String? id_room;

  @override
  List<UserModelDto>? list_user;

  @override
  String? room_name;

  RoomConfigDto(this.id_room, this.list_user, this.room_name);

  factory RoomConfigDto.fromJson(Map<String, dynamic> json) {
    return _$RoomConfigDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RoomConfigDtoToJson(this);
}