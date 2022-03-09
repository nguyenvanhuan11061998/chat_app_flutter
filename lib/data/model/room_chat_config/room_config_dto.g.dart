// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomConfigDto _$RoomConfigDtoFromJson(Map<String, dynamic> json) =>
    RoomConfigDto(
      json['id_room'] as String?,
      (json['list_user'] as List<dynamic>?)
          ?.map((e) => UserModelDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['room_name'] as String?,
    );

Map<String, dynamic> _$RoomConfigDtoToJson(RoomConfigDto instance) =>
    <String, dynamic>{
      'id_room': instance.id_room,
      'list_user': instance.list_user,
      'room_name': instance.room_name,
    };
