


import 'package:freezed_annotation/freezed_annotation.dart';
import '../../model/user/user_model.dart';
part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState(List<UserModel> listUser, List<UserModel> users) = HomeStateData;
  const factory HomeState.loading() = HomeStateLoading;
  const factory HomeState.error(dynamic error) = HomeStateError;
}