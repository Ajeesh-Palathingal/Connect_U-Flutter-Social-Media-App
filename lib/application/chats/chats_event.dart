part of 'chats_bloc.dart';

@freezed
class ChatsEvent with _$ChatsEvent {
  const factory ChatsEvent.sendMessage() = _SendMessage;
}
