import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmates/constants/videoCallApiData.dart';
import 'package:mindmates/controllers/authController.dart';
import 'package:mindmates/controllers/chatController.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find<AuthController>();
    ChatController chatController = Get.find<ChatController>();

    return ZegoUIKitPrebuiltCall(
      appID: AppInfo.appId,
      appSign: AppInfo.appSign,
      callID: chatController.roomId,
      userID: controller.userData?.uid ?? "",
      userName: controller.userData?.name ?? "",
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
