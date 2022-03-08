
import 'package:json_annotation/json_annotation.dart';
import 'package:chat_app_flutter/data/model/user/user_model.dart';

part 'user_model_dto.g.dart';

@JsonSerializable()
class UserModelDto implements UserModel {
  @override
  String? email;

  @override
  String? keyUser;

  @override
  String? name;

  @override
  String? phone;

  @override
  String? avatar;

  UserModelDto(this.keyUser, this.email, this.name, this.phone, this.avatar);

  factory UserModelDto.fromJson(Map<String, dynamic> json) => _$UserModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelDtoToJson(this);
}