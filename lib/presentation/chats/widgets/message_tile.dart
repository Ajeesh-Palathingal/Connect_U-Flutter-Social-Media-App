import 'package:connect_u/core/colors.dart';
import 'package:connect_u/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    super.key,
    required this.showAvatar,
    required this.id,
    required this.message,
    required this.avatarUrl,
  });

  final bool showAvatar;
  final String id;
  final String message;
  final String avatarUrl;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          showAvatar ? SizedBox(height: 30) : SizedBox(height: 10),
          // SizedBox(height: 10),
          id == '1'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    showAvatar
                        ? CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(avatarUrl),
                          )
                        : SizedBox(width: 40),
                    SizedBox(width: 10),
                    Container(
                      width: screenSize.width * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: showAvatar
                            ? BorderRadius.only(topRight: Radius.circular(10))
                            : BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomText(text: message),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: showAvatar
                            ? BorderRadius.only(topLeft: Radius.circular(10))
                            : BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                        color: primaryColor,
                      ),
                      width: screenSize.width * 0.6,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomText(
                          text: message,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    showAvatar
                        ? CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(avatarUrl),
                          )
                        : SizedBox(width: 40),
                  ],
                ),
        ],
      ),
    );
  }
}
