import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmates/controllers/authController.dart';
import 'package:mindmates/home.dart';
import 'package:mindmates/login.dart';
import 'package:mindmates/welcome.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthController>().user != null
          ? HomePage()
          : WelcomePage();
    });
  }
}
