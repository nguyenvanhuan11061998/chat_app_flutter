// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SettingStateTearOff {
  const _$SettingStateTearOff();

  SettingData call(UserModel user) {
    return SettingData(
      user,
    );
  }

  SettingLoading loading() {
    return const SettingLoading();
  }

  SettingError error(dynamic error) {
    return SettingError(
      error,
    );
  }
}

/// @nodoc
const $SettingState = _$SettingStateTearOff();

/// @nodoc
mixin _$SettingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(UserModel user) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(UserModel user)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(UserModel user)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(SettingData value) $default, {
    required TResult Function(SettingLoading value) loading,
    required TResult Function(SettingError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(SettingData value)? $default, {
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(SettingData value)? $default, {
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingStateCopyWith<$Res> {
  factory $SettingStateCopyWith(
          SettingState value, $Res Function(SettingState) then) =
      _$SettingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingStateCopyWithImpl<$Res> implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._value, this._then);

  final SettingState _value;
  // ignore: unused_field
  final $Res Function(SettingState) _then;
}

/// @nodoc
abstract class $SettingDataCopyWith<$Res> {
  factory $SettingDataCopyWith(
          SettingData value, $Res Function(SettingData) then) =
      _$SettingDataCopyWithImpl<$Res>;
  $Res call({UserModel user});
}

/// @nodoc
class _$SettingDataCopyWithImpl<$Res> extends _$SettingStateCopyWithImpl<$Res>
    implements $SettingDataCopyWith<$Res> {
  _$SettingDataCopyWithImpl(
      SettingData _value, $Res Function(SettingData) _then)
      : super(_value, (v) => _then(v as SettingData));

  @override
  SettingData get _value => super._value as SettingData;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(SettingData(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$SettingData implements SettingData {
  const _$SettingData(this.user);

  @override
  final UserModel user;

  @override
  String toString() {
    return 'SettingState(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingData &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  $SettingDataCopyWith<SettingData> get copyWith =>
      _$SettingDataCopyWithImpl<SettingData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(UserModel user) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return $default(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(UserModel user)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return $default?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(UserModel user)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(SettingData value) $default, {
    required TResult Function(SettingLoading value) loading,
    required TResult Function(SettingError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(SettingData value)? $default, {
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(SettingData value)? $default, {
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class SettingData implements SettingState {
  const factory SettingData(UserModel user) = _$SettingData;

  UserModel get user;
  @JsonKey(ignore: true)
  $SettingDataCopyWith<SettingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingLoadingCopyWith<$Res> {
  factory $SettingLoadingCopyWith(
          SettingLoading value, $Res Function(SettingLoading) then) =
      _$SettingLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingLoadingCopyWithImpl<$Res>
    extends _$SettingStateCopyWithImpl<$Res>
    implements $SettingLoadingCopyWith<$Res> {
  _$SettingLoadingCopyWithImpl(
      SettingLoading _value, $Res Function(SettingLoading) _then)
      : super(_value, (v) => _then(v as SettingLoading));

  @override
  SettingLoading get _value => super._value as SettingLoading;
}

/// @nodoc

class _$SettingLoading implements SettingLoading {
  const _$SettingLoading();

  @override
  String toString() {
    return 'SettingState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(UserModel user) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(UserModel user)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(UserModel user)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(SettingData value) $default, {
    required TResult Function(SettingLoading value) loading,
    required TResult Function(SettingError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(SettingData value)? $default, {
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(SettingData value)? $default, {
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SettingLoading implements SettingState {
  const factory SettingLoading() = _$SettingLoading;
}

/// @nodoc
abstract class $SettingErrorCopyWith<$Res> {
  factory $SettingErrorCopyWith(
          SettingError value, $Res Function(SettingError) then) =
      _$SettingErrorCopyWithImpl<$Res>;
  $Res call({dynamic error});
}

/// @nodoc
class _$SettingErrorCopyWithImpl<$Res> extends _$SettingStateCopyWithImpl<$Res>
    implements $SettingErrorCopyWith<$Res> {
  _$SettingErrorCopyWithImpl(
      SettingError _value, $Res Function(SettingError) _then)
      : super(_value, (v) => _then(v as SettingError));

  @override
  SettingError get _value => super._value as SettingError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(SettingError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$SettingError implements SettingError {
  const _$SettingError(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'SettingState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $SettingErrorCopyWith<SettingError> get copyWith =>
      _$SettingErrorCopyWithImpl<SettingError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(UserModel user) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(UserModel user)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(UserModel user)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(SettingData value) $default, {
    required TResult Function(SettingLoading value) loading,
    required TResult Function(SettingError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(SettingData value)? $default, {
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(SettingData value)? $default, {
    TResult Function(SettingLoading value)? loading,
    TResult Function(SettingError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SettingError implements SettingState {
  const factory SettingError(dynamic error) = _$SettingError;

  dynamic get error;
  @JsonKey(ignore: true)
  $SettingErrorCopyWith<SettingError> get copyWith =>
      throw _privateConstructorUsedError;
}
