class Message {
  final String senderId;
  final String senderName;
  final String message;
  final String receiverId;
  final DateTime time;

  Message(
      {required this.senderId,
      required this.senderName,
      required this.message,
      required this.receiverId,
      required this.time});

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderName': senderName,
      'message': message,
      'receiverId': receiverId,
      'time': time,
    };
  }
}
