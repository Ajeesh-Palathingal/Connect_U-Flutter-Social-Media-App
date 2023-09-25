import 'package:bloc/bloc.dart';
import 'package:connect_u/core/constants.dart';
import 'package:connect_u/presentation/chats/chatting_screen.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chats_event.dart';
part 'chats_state.dart';
part 'chats_bloc.freezed.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc() : super(ChatsState.initial()) {
    on<_SendMessage>((event, emit) async {
      print("Value cleared ${sendMessageController.text}");
      try {
        print("working send message bloc inside");
        
        
        messages.add({'message': sendMessageController.text, 'id': 2});
        sendMessageController.clear();
        emit(state.copyWith(messageList: messages, num: state.num + 1));
      } catch (e) {
        print("error in bloc");
        print(e);
      } finally {
        
        messageListScrollController.animateTo(
          messageListScrollController.position.maxScrollExtent * 1.5,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
