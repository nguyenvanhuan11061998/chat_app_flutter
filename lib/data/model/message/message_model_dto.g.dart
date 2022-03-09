// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModelDto _$MessageModelDtoFromJson(Map<String, dynamic> json) =>
    MessageModelDto(
      json['id_room'] as String?,
      json['content'] as String?,
      json['keyUser'] as String?,
      json['time'] == null ? null : DateTime.parse(json['time'] as String),
      json['type'] as String?,
    );

Map<String, dynamic> _$MessageModelDtoToJson(MessageModelDto instance) =>
    <String, dynamic>{
      'id_room': instance.id_room,
      'content': instance.content,
      'keyUser': instance.keyUser,
      'time': instance.time?.toIso8601String(),
      'type': instance.type,
    };
