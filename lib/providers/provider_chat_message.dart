import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import "package:carrotmarket_app/models/model_chat_message.dart";

class ChatMessageProvider with ChangeNotifier {
  List<ChatMessage> chatMessages = [];

  Future<void> fetchChatMessages() async {
    //* mockup DB
    chatMessages = await Future.delayed(Duration(microseconds: 500), () {
      return [
        ChatMessage(
          sender: '당근이, ',
          senderProfileImage: 'https://placeimg.com/200/100/people/grayscale',
          senderLocation: '대부동',
          sentDate: '1일전',
          sentMessage: 'developer 님,근처에 다양한 물품들이 아주 많이있습니다.',
        ),
        ChatMessage(
            sender: 'Flutter ',
            senderProfileImage: 'https://placeimg.com/200/100/people',
            senderLocation: '중동',
            sentDate: '2일전',
            sentMessage: '안녕하세요 지금 다 예약 상태 인가요?',
            productImageUri: 'https://placeimg.com/200/100/tech/grayscale')
      ];
    });
    notifyListeners();
  }
}
