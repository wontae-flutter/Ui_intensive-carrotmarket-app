import 'package:carrotmarket_app/theme.dart';
import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart";
import 'package:provider/provider.dart';
import 'package:carrotmarket_app/widgets/AppBarBottomLine.dart';
import 'package:carrotmarket_app/widgets/ImageContainer.dart';
import 'package:carrotmarket_app/models/model_chat_message.dart';
import 'package:carrotmarket_app/providers/provider_chat_message.dart';

class ChattingTab extends StatelessWidget {
  const ChattingTab({super.key});

  @override
  Widget build(BuildContext context) {
    final chatMessageProvider = Provider.of<ChatMessageProvider>(context);
    return FutureBuilder(
        future: chatMessageProvider.fetchChatMessages(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "당산동",
                style: textTheme().headline1,
              ),
              bottom: AppBarBottomLine(),
            ),
            body: ListView.separated(
                itemBuilder: (context, index) => ChatMessageContainer(
                    chatMessage: chatMessageProvider.chatMessages[index]),
                separatorBuilder: (context, index) => const Divider(
                      height: 0,
                      indent: 16,
                      endIndent: 16,
                    ),
                itemCount: chatMessageProvider.chatMessages.length),
          );
        });
  }
}

class ChatMessageContainer extends StatelessWidget {
  final ChatMessage chatMessage;
  const ChatMessageContainer({
    super.key,
    required this.chatMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      height: 100,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: Row(
          children: [
            ImageContainer(key, chatMessage.senderProfileImage, 50, 50, 25),
            SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: chatMessage.sender, style: textTheme().bodyText1),
                  TextSpan(text: " ${chatMessage.senderLocation}"),
                  TextSpan(text: " ${chatMessage.sentDate}"),
                ])),
                Text(
                  chatMessage.sentMessage,
                  style: textTheme().bodyText1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )),
            Visibility(
                visible: chatMessage.productImageUri != null,
                child: ImageContainer(
                    key, chatMessage.productImageUri ?? "", 50, 50, 8))
          ],
        ),
      ),
    );
  }
}
