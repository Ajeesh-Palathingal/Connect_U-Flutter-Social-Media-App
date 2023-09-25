part of 'chats_bloc.dart';

@freezed
class ChatsState with _$ChatsState {
  const factory ChatsState({
    required List<Map<String, Object>> messageList,
    required int num
  }) = _ChatsState;

  factory ChatsState.initial() => ChatsState(
        messageList: messages,
        num: 0
      );
}
