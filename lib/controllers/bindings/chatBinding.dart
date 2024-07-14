import 'package:get/get.dart';
import 'package:mindmates/controllers/authController.dart';
import 'package:mindmates/controllers/chatController.dart';

class ChatBinding extends Bindings {
  final String receiverId;

  // constructor
  ChatBinding(this.receiverId);

  @override
  void dependencies() {
    Get.put<ChatController>(ChatController(receiverId: receiverId));
  }
}
