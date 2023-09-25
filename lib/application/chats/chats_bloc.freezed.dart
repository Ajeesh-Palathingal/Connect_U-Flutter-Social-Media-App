// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMessage value) sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendMessage value)? sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMessage value)? sendMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsEventCopyWith<$Res> {
  factory $ChatsEventCopyWith(
          ChatsEvent value, $Res Function(ChatsEvent) then) =
      _$ChatsEventCopyWithImpl<$Res, ChatsEvent>;
}

/// @nodoc
class _$ChatsEventCopyWithImpl<$Res, $Val extends ChatsEvent>
    implements $ChatsEventCopyWith<$Res> {
  _$ChatsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SendMessageCopyWith<$Res> {
  factory _$$_SendMessageCopyWith(
          _$_SendMessage value, $Res Function(_$_SendMessage) then) =
      __$$_SendMessageCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SendMessageCopyWithImpl<$Res>
    extends _$ChatsEventCopyWithImpl<$Res, _$_SendMessage>
    implements _$$_SendMessageCopyWith<$Res> {
  __$$_SendMessageCopyWithImpl(
      _$_SendMessage _value, $Res Function(_$_SendMessage) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SendMessage implements _SendMessage {
  const _$_SendMessage();

  @override
  String toString() {
    return 'ChatsEvent.sendMessage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SendMessage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendMessage,
  }) {
    return sendMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendMessage,
  }) {
    return sendMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMessage value) sendMessage,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendMessage value)? sendMessage,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMessage value)? sendMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class _SendMessage implements ChatsEvent {
  const factory _SendMessage() = _$_SendMessage;
}

/// @nodoc
mixin _$ChatsState {
  List<Map<String, Object>> get messageList =>
      throw _privateConstructorUsedError;
  int get num => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatsStateCopyWith<ChatsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsStateCopyWith<$Res> {
  factory $ChatsStateCopyWith(
          ChatsState value, $Res Function(ChatsState) then) =
      _$ChatsStateCopyWithImpl<$Res, ChatsState>;
  @useResult
  $Res call({List<Map<String, Object>> messageList, int num});
}

/// @nodoc
class _$ChatsStateCopyWithImpl<$Res, $Val extends ChatsState>
    implements $ChatsStateCopyWith<$Res> {
  _$ChatsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageList = null,
    Object? num = null,
  }) {
    return _then(_value.copyWith(
      messageList: null == messageList
          ? _value.messageList
          : messageList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, Object>>,
      num: null == num
          ? _value.num
          : num // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatsStateCopyWith<$Res>
    implements $ChatsStateCopyWith<$Res> {
  factory _$$_ChatsStateCopyWith(
          _$_ChatsState value, $Res Function(_$_ChatsState) then) =
      __$$_ChatsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Map<String, Object>> messageList, int num});
}

/// @nodoc
class __$$_ChatsStateCopyWithImpl<$Res>
    extends _$ChatsStateCopyWithImpl<$Res, _$_ChatsState>
    implements _$$_ChatsStateCopyWith<$Res> {
  __$$_ChatsStateCopyWithImpl(
      _$_ChatsState _value, $Res Function(_$_ChatsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageList = null,
    Object? num = null,
  }) {
    return _then(_$_ChatsState(
      messageList: null == messageList
          ? _value._messageList
          : messageList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, Object>>,
      num: null == num
          ? _value.num
          : num // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChatsState implements _ChatsState {
  const _$_ChatsState(
      {required final List<Map<String, Object>> messageList, required this.num})
      : _messageList = messageList;

  final List<Map<String, Object>> _messageList;
  @override
  List<Map<String, Object>> get messageList {
    if (_messageList is EqualUnmodifiableListView) return _messageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messageList);
  }

  @override
  final int num;

  @override
  String toString() {
    return 'ChatsState(messageList: $messageList, num: $num)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatsState &&
            const DeepCollectionEquality()
                .equals(other._messageList, _messageList) &&
            (identical(other.num, num) || other.num == num));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_messageList), num);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatsStateCopyWith<_$_ChatsState> get copyWith =>
      __$$_ChatsStateCopyWithImpl<_$_ChatsState>(this, _$identity);
}

abstract class _ChatsState implements ChatsState {
  const factory _ChatsState(
      {required final List<Map<String, Object>> messageList,
      required final int num}) = _$_ChatsState;

  @override
  List<Map<String, Object>> get messageList;
  @override
  int get num;
  @override
  @JsonKey(ignore: true)
  _$$_ChatsStateCopyWith<_$_ChatsState> get copyWith =>
      throw _privateConstructorUsedError;
}
