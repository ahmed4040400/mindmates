import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as rtc;
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mindmates/controllers/authController.dart';
import 'package:mindmates/models/message.dart';

class ChatController extends GetxController {
  final String receiverId;
  ChatController({required this.receiverId});

  final _db = FirebaseFirestore.instance;
  RxString chatRoomId = "".obs;

  // for video call
  String get roomId => chatRoomId.value;
  final rtc.RTCVideoRenderer _localRenderer = rtc.RTCVideoRenderer();
  final rtc.RTCVideoRenderer _remoteRenderer = rtc.RTCVideoRenderer();

  final RxList<Message> chats = <Message>[].obs;

  @override
  void onInit() async {
    _localRenderer.initialize();
    _remoteRenderer.initialize();
    chatRoomId.value = await _getChatRoomId();
    super.onInit();

    fetchMessages();
  }

  @override
  void onClose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.onClose();
  }

  Future<String> _getChatRoomId() async {
    final authcontroller = Get.find<AuthController>();

    List<String> ids = [
      authcontroller.userData?.uid ?? "",
      receiverId,
    ];
    ids.sort();
    String chatRoomId = ids.join('_');
    return chatRoomId;
  }

  void sendMessage(String messageText) async {
    final authcontroller = Get.find<AuthController>();

    Message message = new Message(
      senderId: authcontroller.userData?.uid ?? "",
      senderName: authcontroller.userData?.name ?? "",
      message: messageText,
      receiverId: receiverId,
      time: DateTime.now(),
    );

    List<String> ids = [
      message.senderId,
      message.receiverId,
    ];
    ids.sort();
    String chatRoomId = ids.join('_');
    print(chatRoomId);
    try {
      await _db.collection('messages').doc(chatRoomId).set({
        "senderId": message.senderId,
        "receiverId": message.receiverId,
      });

      await _db
          .collection('messages')
          .doc(chatRoomId)
          .collection('msgList')
          .add(
            message.toMap(),
          );
    } catch (e) {
      print(e.toString());
    }
  }

  void fetchMessages() {
    final authcontroller = Get.find<AuthController>();

    List<String> ids = [
      authcontroller.userData?.uid ?? "",
      receiverId,
    ];
    ids.sort();
    String chatRoomId = ids.join('_');

    try {
      _db
          .collection('messages')
          .doc(chatRoomId)
          .collection('msgList')
          .orderBy('time', descending: false)
          .snapshots()
          .listen((event) {
        chats.clear();
        event.docs.forEach((element) {
          chats.add(Message(
            senderId: element['senderId'],
            senderName: element['senderName'],
            message: element['message'],
            receiverId: element['receiverId'],
            time: element['time'].toDate(),
          ));
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
