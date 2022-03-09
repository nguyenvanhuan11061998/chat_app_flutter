// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatRoomStateTearOff {
  const _$ChatRoomStateTearOff();

  ChatRoomData call(RoomConfigModel roomConfigModel) {
    return ChatRoomData(
      roomConfigModel,
    );
  }

  ChatRoomLoading loading() {
    return const ChatRoomLoading();
  }

  ChatRoomError error(dynamic error) {
    return ChatRoomError(
      error,
    );
  }
}

/// @nodoc
const $ChatRoomState = _$ChatRoomStateTearOff();

/// @nodoc
mixin _$ChatRoomState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(RoomConfigModel roomConfigModel) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(RoomConfigModel roomConfigModel)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(RoomConfigModel roomConfigModel)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ChatRoomData value) $default, {
    required TResult Function(ChatRoomLoading value) loading,
    required TResult Function(ChatRoomError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(ChatRoomData value)? $default, {
    TResult Function(ChatRoomLoading value)? loading,
    TResult Function(ChatRoomError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ChatRoomData value)? $default, {
    TResult Function(ChatRoomLoading value)? loading,
    TResult Function(ChatRoomError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomStateCopyWith<$Res> {
  factory $ChatRoomStateCopyWith(
          ChatRoomState value, $Res Function(ChatRoomState) then) =
      _$ChatRoomStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatRoomStateCopyWithImpl<$Res>
    implements $ChatRoomStateCopyWith<$Res> {
  _$ChatRoomStateCopyWithImpl(this._value, this._then);

  final ChatRoomState _value;
  // ignore: unused_field
  final $Res Function(ChatRoomState) _then;
}

/// @nodoc
abstract class $ChatRoomDataCopyWith<$Res> {
  factory $ChatRoomDataCopyWith(
          ChatRoomData value, $Res Function(ChatRoomData) then) =
      _$ChatRoomDataCopyWithImpl<$Res>;
  $Res call({RoomConfigModel roomConfigModel});
}

/// @nodoc
class _$ChatRoomDataCopyWithImpl<$Res> extends _$ChatRoomStateCopyWithImpl<$Res>
    implements $ChatRoomDataCopyWith<$Res> {
  _$ChatRoomDataCopyWithImpl(
      ChatRoomData _value, $Res Function(ChatRoomData) _then)
      : super(_value, (v) => _then(v as ChatRoomData));

  @override
  ChatRoomData get _value => super._value as ChatRoomData;

  @override
  $Res call({
    Object? roomConfigModel = freezed,
  }) {
    return _then(ChatRoomData(
      roomConfigModel == freezed
          ? _value.roomConfigModel
          : roomConfigModel // ignore: cast_nullable_to_non_nullable
              as RoomConfigModel,
    ));
  }
}

/// @nodoc

class _$ChatRoomData implements ChatRoomData {
  const _$ChatRoomData(this.roomConfigModel);

  @override
  final RoomConfigModel roomConfigModel;

  @override
  String toString() {
    return 'ChatRoomState(roomConfigModel: $roomConfigModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatRoomData &&
            const DeepCollectionEquality()
                .equals(other.roomConfigModel, roomConfigModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(roomConfigModel));

  @JsonKey(ignore: true)
  @override
  $ChatRoomDataCopyWith<ChatRoomData> get copyWith =>
      _$ChatRoomDataCopyWithImpl<ChatRoomData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(RoomConfigModel roomConfigModel) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return $default(roomConfigModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(RoomConfigModel roomConfigModel)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return $default?.call(roomConfigModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(RoomConfigModel roomConfigModel)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(roomConfigModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ChatRoomData value) $default, {
    required TResult Function(ChatRoomLoading value) loading,
    required TResult Function(ChatRoomError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(ChatRoomData value)? $default, {
    TResult Function(ChatRoomLoading value)? loading,
    TResult Function(ChatRoomError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ChatRoomData value)? $default, {
    TResult Function(ChatRoomLoading value)? loading,
    TResult Function(ChatRoomError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class ChatRoomData implements ChatRoomState {
  const factory ChatRoomData(RoomConfigModel roomConfigModel) = _$ChatRoomData;

  RoomConfigModel get roomConfigModel;
  @JsonKey(ignore: true)
  $ChatRoomDataCopyWith<ChatRoomData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomLoadingCopyWith<$Res> {
  factory $ChatRoomLoadingCopyWith(
          ChatRoomLoading value, $Res Function(ChatRoomLoading) then) =
      _$ChatRoomLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatRoomLoadingCopyWithImpl<$Res>
    extends _$ChatRoomStateCopyWithImpl<$Res>
    implements $ChatRoomLoadingCopyWith<$Res> {
  _$ChatRoomLoadingCopyWithImpl(
      ChatRoomLoading _value, $Res Function(ChatRoomLoading) _then)
      : super(_value, (v) => _then(v as ChatRoomLoading));

  @override
  ChatRoomLoading get _value => super._value as ChatRoomLoading;
}

/// @nodoc

class _$ChatRoomLoading implements ChatRoomLoading {
  const _$ChatRoomLoading();

  @override
  String toString() {
    return 'ChatRoomState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChatRoomLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(RoomConfigModel roomConfigModel) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(RoomConfigModel roomConfigModel)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(RoomConfigModel roomConfigModel)? $default, {
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
    TResult Function(ChatRoomData value) $default, {
    required TResult Function(ChatRoomLoading value) loading,
    required TResult Function(ChatRoomError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(ChatRoomData value)? $default, {
    TResult Function(ChatRoomLoading value)? loading,
    TResult Function(ChatRoomError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ChatRoomData value)? $default, {
    TResult Function(ChatRoomLoading value)? loading,
    TResult Function(ChatRoomError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ChatRoomLoading implements ChatRoomState {
  const factory ChatRoomLoading() = _$ChatRoomLoading;
}

/// @nodoc
abstract class $ChatRoomErrorCopyWith<$Res> {
  factory $ChatRoomErrorCopyWith(
          ChatRoomError value, $Res Function(ChatRoomError) then) =
      _$ChatRoomErrorCopyWithImpl<$Res>;
  $Res call({dynamic error});
}

/// @nodoc
class _$ChatRoomErrorCopyWithImpl<$Res>
    extends _$ChatRoomStateCopyWithImpl<$Res>
    implements $ChatRoomErrorCopyWith<$Res> {
  _$ChatRoomErrorCopyWithImpl(
      ChatRoomError _value, $Res Function(ChatRoomError) _then)
      : super(_value, (v) => _then(v as ChatRoomError));

  @override
  ChatRoomError get _value => super._value as ChatRoomError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ChatRoomError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$ChatRoomError implements ChatRoomError {
  const _$ChatRoomError(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'ChatRoomState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatRoomError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $ChatRoomErrorCopyWith<ChatRoomError> get copyWith =>
      _$ChatRoomErrorCopyWithImpl<ChatRoomError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(RoomConfigModel roomConfigModel) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(RoomConfigModel roomConfigModel)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(RoomConfigModel roomConfigModel)? $default, {
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
    TResult Function(ChatRoomData value) $default, {
    required TResult Function(ChatRoomLoading value) loading,
    required TResult Function(ChatRoomError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(ChatRoomData value)? $default, {
    TResult Function(ChatRoomLoading value)? loading,
    TResult Function(ChatRoomError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ChatRoomData value)? $default, {
    TResult Function(ChatRoomLoading value)? loading,
    TResult Function(ChatRoomError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ChatRoomError implements ChatRoomState {
  const factory ChatRoomError(dynamic error) = _$ChatRoomError;

  dynamic get error;
  @JsonKey(ignore: true)
  $ChatRoomErrorCopyWith<ChatRoomError> get copyWith =>
      throw _privateConstructorUsedError;
}
