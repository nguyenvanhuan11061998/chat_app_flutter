


import 'package:freezed_annotation/freezed_annotation.dart';
import '../../model/user/user_model.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.authorized() =
  AuthStateAuthorized;
  const factory AuthState.unAuthorized() = AuthStateUnAuthorized;
}