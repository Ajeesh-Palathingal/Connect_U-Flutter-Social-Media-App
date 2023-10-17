import 'package:connect_u/application/chats/chats_bloc.dart';
import 'package:connect_u/core/colors.dart';
import 'package:connect_u/core/constants.dart';
import 'package:connect_u/presentation/chats/widgets/message_tile.dart';
import 'package:connect_u/presentation/home/widgets/post_tile.dart';
import 'package:connect_u/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final sendMessageController = TextEditingController();
final messageListScrollController = ScrollController();

class ChattingScreen extends StatelessWidget {
  ChattingScreen({
    super.key,
    required this.name,
    required this.friendAvatarUrl,
  });
  final String name;
  final String friendAvatarUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
        ),
        title: CustomText(
          text: name,
          size: kHeadingSize,
          fontweight: FontWeight.bold,
        ),
      ),
      body: BlocBuilder<ChatsBloc, ChatsState>(
        builder: (context, state) {
          return Column(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: BlocBuilder<ChatsBloc, ChatsState>(
                    builder: (context, state) {
                      return ListView.builder(
                        controller: messageListScrollController,
                        itemCount: state.messageList.length,
                        itemBuilder: (context, index) {
                          final messageList = state.messageList;
                          // displaying first message
                          if (index == 0) {
                            //checking whether its the user or friend
                            if (messageList[index]['id'] == 1) {
                              return MessageTile(
                                showAvatar: true,
                                avatarUrl: friendAvatarUrl,
                                id: messageList[index]['id'].toString(),
                                message:
                                    messageList[index]['message'].toString(),
                              );
                            } else {
                              return MessageTile(
                                showAvatar: true,
                                avatarUrl: "https://tinyurl.com/5xmbz9k4",
                                id: messageList[index]['id'].toString(),
                                message:
                                    messageList[index]['message'].toString(),
                              );
                            }
                          }
                          // checking whether want to display avathar with the message or not
                          else if (messageList[index]['id'] !=
                              messageList[index - 1]['id']) {
                            if (messageList[index]['id'] == 1) {
                              return MessageTile(
                                showAvatar: true,
                                avatarUrl: friendAvatarUrl,
                                id: messageList[index]['id'].toString(),
                                message:
                                    messageList[index]['message'].toString(),
                              );
                            } else {
                              return MessageTile(
                                showAvatar: true,
                                avatarUrl: "https://tinyurl.com/5xmbz9k4",
                                id: messageList[index]['id'].toString(),
                                message:
                                    messageList[index]['message'].toString(),
                              );
                            }
                          } else {
                            return MessageTile(
                              avatarUrl: friendAvatarUrl,
                              showAvatar: false,
                              id: messageList[index]['id'].toString(),
                              message: messageList[index]['message'].toString(),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
              Divider(thickness: 1),
              Container(
                height: 70,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          textCapitalization: TextCapitalization.words,
                          controller: sendMessageController,
                          style: const TextStyle(color: kBlackColor),
                          decoration: const InputDecoration(
                            hintText: "Say something",
                            hintStyle: TextStyle(color: kGreyColor),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kGreyColor,
                                width: 2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        onPressed: () async {
                          // focusNode.unfocus();
                          print("onpressed");
                          context
                              .read<ChatsBloc>()
                              .add(const ChatsEvent.sendMessage());
                        },
                        icon: const Icon(
                          Icons.send,
                          color: primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

// Padding(
//         padding: const EdgeInsets.all(20),
//         child: Container(
//           height: double.infinity,
//           child: Column(
//             children: [
//               BlocBuilder<ChatsBloc, ChatsState>(
//                 builder: (context, state) {
//                   return Flexible(
//                     child: ListView.builder(
//                       itemCount: messages.length,
//                       itemBuilder: (context, index) {
//                         // print("msg ${messages[index]['id']}");
//                         if (index == 0) {
//                           return MessageTile(
//                             showAvatar: true,
//                             friendAvatarUrl: friendAvatarUrl,
//                             id: messages[index]['id']!,
//                             message: messages[index]['message']!,
//                           );
//                         } else if (messages[index]['id'] != messages[index - 1]['id']) {
//                           return MessageTile(
//                             showAvatar: true,
//                             friendAvatarUrl: friendAvatarUrl,
//                             id: messages[index]['id']!,
//                             message: messages[index]['message']!,
//                           );
//                         } else {
//                           return MessageTile(
//                             friendAvatarUrl: friendAvatarUrl,
//                             showAvatar: false,
//                             id: messages[index]['id']!,
//                             message: messages[index]['message']!,
//                           );
//                         }
//                       },
//                     ),
//                   );
//                 },
//               ),
//               Divider(
//                 thickness: 2,
//                 indent: 0,
//               ),
//               Container(
//                 height: 30,
//                 child: Row(
//                   children: [TextField()],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
