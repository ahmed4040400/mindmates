import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_audio.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:chat_bubbles/date_chips/date_chip.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mindmates/call.dart';
import 'package:mindmates/controllers/authController.dart';
import 'package:mindmates/controllers/chatController.dart';
import 'package:mindmates/models/message.dart';
import 'package:mindmates/constants/mycolors.dart';

class ChatPage extends GetWidget<ChatController> {
  final String receiverId;
  const ChatPage({Key? key, required this.receiverId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find<AuthController>();
    final username = auth.userData?.name ?? "";
    return Scaffold(
      appBar: AppBar(
        // add height to the app bar

        title: Text(
          'Chat with specialist',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: CustomColors.mainBlue,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.video_call,
              color: Colors.white,
            ),
            onPressed: () {
              if (auth.isAppOwner) {
                controller.sendMessage("@==/videoCall/==@");
                Get.to(CallPage());
              } else {
                AwesomeDialog(
                  context: Get.context!,
                  dialogType: DialogType.info,
                  animType: AnimType.rightSlide,
                  btnOkColor: CustomColors.mainBlue,
                  btnOkText: "Pay",
                  body: Center(
                    child: Column(
                      children: [
                        Text(
                          'Payment 100 EGP',
                          style: TextStyle(
                            fontSize: 20,
                            color: CustomColors.mainBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'card number',
                            // Revome any border and make the bg color light blue
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: CustomColors.mainBlue,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.credit_card,
                              color: CustomColors.mainBlue,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'CVC',
                            // Revome any border and make the bg color light blue
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: CustomColors.mainBlue,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.numbers,
                              color: CustomColors.mainBlue,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Card Expiration',
                            // Revome any border and make the bg color light blue
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: CustomColors.mainBlue,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.date_range_outlined,
                              color: CustomColors.mainBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  btnOkOnPress: () {
                    controller.sendMessage("@==/videoCall/==@");
                    Get.to(CallPage());
                  },
                ).show();
              }
            },
          ),
        ],
        // add an icon at the end of the app bar

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          // add an icon at the end of the app bar

          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
              reverse: true,
              child: Obx(
                () => Column(
                  children: <Widget>[
                    for (Message i in controller.chats)
                      i.message != "@==/videoCall/==@"
                          ? BubbleSpecialThree(
                              text: i.message,
                              color: i.senderId == auth.userData?.uid
                                  ? Color(0xFF1B97F3)
                                  : Color(0xFFE8E8EE),
                              tail: true,
                              textStyle: TextStyle(
                                  color: i.senderId ==
                                          Get.find<AuthController>()
                                              .userData
                                              ?.uid
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16),
                              isSender: i.senderId ==
                                  Get.find<AuthController>().userData?.uid,
                            )
                          : Align(
                              alignment: i.senderId == auth.userData?.uid
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 19.0, vertical: 3),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          WidgetStateProperty.all<Color>(
                                        i.senderId == auth.userData?.uid
                                            ? Color(0xFF1B97F3)
                                            : Color(0xFFE8E8EE),
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.to(() => CallPage());
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.video_call,
                                          color:
                                              i.senderId == auth.userData?.uid
                                                  ? Colors.white
                                                  : Colors.black,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "$username is calling ",
                                          style: TextStyle(
                                              color: i.senderId ==
                                                      auth.userData?.uid
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              )),
          MessageBar(
            onSend: (message) {
              controller.sendMessage(message);
            },
            actions: [
              InkWell(
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 24,
                ),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
