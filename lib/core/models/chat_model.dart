class MessageModel {
  late String senderId;
  late String receiverId;
  late String text;
  late String date;

  MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.date,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'] ?? '';
    receiverId = json['receiverId'] ?? '';
    text = json['text'] ?? '';
    date = json['date'] ?? '';
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'date': date,
    };
  }
}
