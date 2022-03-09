

import 'package:json_annotation/json_annotation.dart';
import 'package:chat_app_flutter/data/model/message/message_model.dart';

part 'message_model_dto.g.dart';

@JsonSerializable()
class MessageModelDto implements MessageModel {
  @override
  String? id_room;

  @override
  String? content;

  @override
  String? keyUser;

  @override
  DateTime? time;

  @override
  String? type;

  MessageModelDto(this.id_room, this.content, this.keyUser, this.time, this.type);

  factory MessageModelDto.fromJson(Map<String, dynamic> json) {
    return _$MessageModelDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessageModelDtoToJson(this);

}