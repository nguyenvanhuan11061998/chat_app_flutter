

import 'package:chat_app_flutter/data/model/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'setting_state.freezed.dart';

@freezed
abstract class SettingState with _$SettingState {
  const factory SettingState(UserModel user) = SettingData;
  const factory SettingState.loading() = SettingLoading;
  const factory SettingState.error(dynamic error) = SettingError;
}