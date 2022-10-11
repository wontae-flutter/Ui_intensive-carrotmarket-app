//* 지금 Product 모델의 image가 있는데

class ChatMessage {
  final String sender;
  final String senderProfileImage;
  final String senderLocation;
  final String sentDate;
  final String sentMessage;
  final String? productImageUri;

  ChatMessage({
    required this.sender,
    required this.senderProfileImage,
    required this.senderLocation,
    required this.sentDate,
    required this.sentMessage,
    this.productImageUri,
  });
}
