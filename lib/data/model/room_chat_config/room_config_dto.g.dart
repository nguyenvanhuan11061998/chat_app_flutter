// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomConfigDto _$RoomConfigDtoFromJson(Map<String, dynamic> json) =>
    RoomConfigDto(
      (json['list_user'] as List<dynamic>?)
          ?.map((e) => UserModelDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['room_name'] as String?,
      json['room_image'] as String?,
    );

Map<String, dynamic> _$RoomConfigDtoToJson(RoomConfigDto instance) =>
    <String, dynamic>{
      'list_user': instance.list_user?.map((e) => e.toJson()).toList(),
      'room_name': instance.room_name,
      'room_image': instance.room_image,
    };
