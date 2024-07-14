import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmates/chat.dart';
import 'package:mindmates/controllers/authController.dart';
import 'package:mindmates/controllers/bindings/chatBinding.dart';
import 'package:mindmates/controllers/chatController.dart';
import 'package:mindmates/constants/mycolors.dart';

class ChatRooms extends GetWidget<AuthController> {
  const ChatRooms({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.getAllUsers().then((users) {
    //   // print(users);
    // });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(500, 60),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                color: CustomColors.mainBlue,
                iconSize: 50,
                icon: Icon(Icons.person_outlined),
                onPressed: () {},
              ),
              Column(mainAxisSize: MainAxisSize.min, children: [
                Text(" ${controller.userData?.name ?? ''}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    )),
              ]),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  children: [
                    IconButton(
                      color: Colors.black,
                      iconSize: 30,
                      icon: const Icon(Icons.logout),
                      onPressed: () {
                        Get.find<AuthController>().logout();
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          CustomColors.skyBlue,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: controller.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                if (snapshot.data?[index]['uid'] != controller.userData?.uid) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: CustomColors.skyBlue, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Text(snapshot.data?[index]['name']),
                      leading: Icon(
                        Icons.person,
                        color: CustomColors.mainBlue,
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: CustomColors.mainBlue,
                      ),
                      subtitle: Text(
                        snapshot.data?[index]['email'],
                        style: TextStyle(color: CustomColors.skyBlue),
                      ),
                      onTap: () {
                        Get.to(
                            ChatPage(
                              receiverId: snapshot.data?[index]['uid'],
                            ),
                            binding: ChatBinding(snapshot.data?[index]['uid']));
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            );
          }
          return Text('loading...');
        },
      ),
    );
  }
}
