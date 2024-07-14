import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindmates/login.dart';
import 'package:mindmates/constants/mycolors.dart';
import 'package:mindmates/signup.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // asset image
            Image.asset(
              'assets/logo.png',
              height: 200,
              width: 200,
            ),
            // text
            const Text(
              'ADHD',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w100,
                color: Color(0xff2260FF),

                // reduce the text height
              ),
            ),
            const Text(
              'helper',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w100,
                  height: 0.5,
                  color: CustomColors.mainBlue),
            ),
            SizedBox(
              height: 20,
            ),
            // button

            const SizedBox(
              height: 20,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Easily connect with top ADHD specialists, access valuable resources, and join a supportive community. Simplify your journey with ADHD helper!",
                // style it to make text align to center and make the color black and add a padding horezontally to the text
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: () {
                Get.to(LoginPage());
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
            const SizedBox(
              height: 10,
            ),

            ElevatedButton(
              onPressed: () {
                Get.to(SignUpPage());
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
                          'Payment 50 EGP',
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
                  btnOkOnPress: () {},
                ).show();
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                    color: Color(0xff2260FF),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              // stile it to have a bg color of 0xff2260FF and white text
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffCAD6FF),
                padding:
                    const EdgeInsets.symmetric(horizontal: 55, vertical: 20),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
