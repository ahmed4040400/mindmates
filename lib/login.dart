import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmates/controllers/authController.dart';
import 'package:mindmates/home.dart';
import 'package:mindmates/constants/mycolors.dart';

class LoginPage extends GetWidget<AuthController> {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // add and apppar with transparent background and a back button and a title that says "Login with color of CustomColors.mainBlue
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            color: CustomColors.mainBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: CustomColors.mainBlue,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      // basic login page
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Welcome',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: CustomColors.mainBlue,
              ),
            ),
            const Text(
              "Easily connect with top ADHD specialists, access valuable resources, and join a supportive community. Simplify your journey with ADHD helper!",
              // style it to make text align to center and make the color black and add a padding horezontally to the text
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'email',
                // Revome any border and make the bg color light blue
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: CustomColors.mainBlue,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.email,
                  color: CustomColors.mainBlue,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: CustomColors.mainBlue,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.password,
                  color: CustomColors.mainBlue,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.login(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: Text(
                  'Log in',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                // stile it to have a bg color of 0xff2260FF and white text
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.mainBlue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
