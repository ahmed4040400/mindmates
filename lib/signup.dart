import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mindmates/controllers/authController.dart';
import 'package:mindmates/constants/mycolors.dart';

class SignUpPage extends GetWidget<AuthController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final nameController = TextEditingController();
    final mobileNumberController = TextEditingController();

    return Scaffold(
      // add and apppar with transparent background and a back button and a title that says "Login with color of CustomColors.mainBlue
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Sign up',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'full name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: CustomColors.mainBlue,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: CustomColors.mainBlue,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: mobileNumberController,
                decoration: InputDecoration(
                  labelText: 'mobile number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: CustomColors.mainBlue,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.person,
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
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'confirm password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: CustomColors.mainBlue,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.confirmation_number,
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
                    controller.createUser(
                      email: emailController.text,
                      password: passwordController.text,
                      phone: mobileNumberController.text,
                      name: nameController.text,
                      confirmPassword: confirmPasswordController.text,
                    );
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  // stile it to have a bg color of 0xff2260FF and white text
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.mainBlue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
