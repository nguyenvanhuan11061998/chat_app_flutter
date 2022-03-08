// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModelDto _$UserModelDtoFromJson(Map<String, dynamic> json) => UserModelDto(
      json['keyUser'] as String?,
      json['email'] as String?,
      json['name'] as String?,
      json['phone'] as String?,
      json['avatar'] as String?,
    );

Map<String, dynamic> _$UserModelDtoToJson(UserModelDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'keyUser': instance.keyUser,
      'name': instance.name,
      'phone': instance.phone,
      'avatar': instance.avatar,
    };
