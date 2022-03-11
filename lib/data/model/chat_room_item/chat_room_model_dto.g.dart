// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomModelDto _$ChatRoomModelDtoFromJson(Map<String, dynamic> json) =>
    ChatRoomModelDto(
      json['id_room'] as String?,
      json['late_message'] as String?,
      json['late_time'] as String?,
      (json['list_user'] as List<dynamic>?)
          ?.map((e) => UserModelDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['room_name'] as String?,
    );

Map<String, dynamic> _$ChatRoomModelDtoToJson(ChatRoomModelDto instance) =>
    <String, dynamic>{
      'id_room': instance.id_room,
      'late_message': instance.late_message,
      'late_time': instance.late_time,
      'room_name': instance.room_name,
      'list_user': instance.list_user?.map((e) => e.toJson()).toList(),
    };
