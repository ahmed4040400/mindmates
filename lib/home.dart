import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:day_picker/day_picker.dart';
import 'package:day_picker/model/day_in_week.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mindmates/activites.dart';
import 'package:mindmates/call.dart';
import 'package:mindmates/chat.dart';
import 'package:mindmates/chatRooms.dart';
import 'package:mindmates/controllers/authController.dart';
import 'package:mindmates/controllers/bindings/chatBinding.dart';
import 'package:mindmates/controllers/chatController.dart';
import 'package:mindmates/instructions.dart';
import 'package:mindmates/constants/mycolors.dart';
import 'package:mindmates/models/user.dart';

List<Widget> pages = [
  const MyHomePage(),
  const ActivitiesPage(),
  const InstructionsPage(),
];
int pageIndex = 0;

class SettingsPage {}

List<DayInWeek> _days = [
  DayInWeek("Sun", dayKey: 'sun'),
  DayInWeek("Mon", dayKey: 'mon'),
  DayInWeek("Tue", dayKey: 'tue'),
  DayInWeek("Wed", dayKey: 'wed'),
  DayInWeek("Thu", dayKey: 'thu'),
  DayInWeek("Fri", dayKey: 'fri'),
  DayInWeek("Sat", dayKey: 'sat', isSelected: true),
];
List<Map> doctorsDummyData = [
  {
    'name': "John Doe",
    "position": "Pediatric ADHD Specialist",
    "availableAt": ["mon", "tue", "wed"],
    "imgPath": "assets/doctorp.png",
    "ratingStars": 4.7,
    "online": true,
    "busy": false,
  },
  {
    'name': "Jane Smith",
    "position": "ADHD Psychiatrist",
    "availableAt": ["tue", "wed", "thu"],
    "imgPath": "assets/doctorp.png",
    "ratingStars": 4.5,
    "online": true,
    "busy": false,
  },
  {
    'name': "Robert Johnson",
    "position": "Behavioral Health ADHD Physician",
    "availableAt": ["wed", "thu", "fri"],
    "imgPath": "assets/doctorp.png",
    "ratingStars": 3.3,
    "online": true,
    "busy": false,
  },
  {
    'name': "Laura Williams",
    "position": "ADHD Clinical Psychologist",
    "availableAt": ["thu", "fri", "sat"],
    "imgPath": "assets/doctorp.png",
    "ratingStars": 4.8,
    "online": true,
    "busy": false,
  },
  {
    'name': "James Brown",
    "position": "ADHD Treatment Program Director",
    "availableAt": ["fri", "sat", "sun"],
    "imgPath": "assets/doctorp.png",
    "ratingStars": 4.6,
    "online": false,
    "busy": false,
  },
  {
    'name': "Patricia Davis",
    "position": "ADHD Assessment Specialist",
    "availableAt": ["sat", "sun", "mon"],
    "imgPath": "assets/doctorp.png",
    "ratingStars": 4.4,
    "online": true,
    "busy": true,
  },
  {
    'name': "Michael Miller",
    "position": "ADHD and Autism Spectrum Disorder (ASD) Specialist",
    "availableAt": ["sun", "mon", "tue"],
    "imgPath": "assets/doctorp.png",
    "ratingStars": 4.2,
    "online": true,
    "busy": false,
  },
  {
    'name': "Linda Wilson",
    "position": "ADHD Coach and Counselor",
    "availableAt": ["mon", "wed", "fri"],
    "imgPath": "assets/doctorp.png",
    "ratingStars": 4.9,
    "online": true,
    "busy": false,
  },
  {
    'name': "William Moore",
    "position": "Adult ADHD Specialist",
    "availableAt": ["tue", "thu", "sat"],
    "imgPath": "assets/doctorp.png",
    "ratingStars": 2.1,
    "online": true,
    "busy": false,
  },
  {
    'name': "Elizabeth Taylor",
    "position": "ADHD Medical Consultant",
    "availableAt": ["wed", "fri", "sun"],
    "imgPath": "assets/doctorp.png",
    "ratingStars": 4.0,
    "online": true,
    "busy": false,
  },
  {
    'name': "David Anderson",
    "position": "ADHD Telemedicine Physician",
    "availableAt": ["thu", "sat", "mon"],
    "imgPath": "assets/doctorp.png",
    "ratingStars": 4.7,
    "online": true,
    "busy": false,
  },
  {
    'name': "Jennifer Thomas",
    "position": "ADHD Behavioral Therapist",
    "availableAt": ["fri", "sun", "tue"],
    "imgPath": "assets/doctorp.png",
    "ratingStars": 4.5,
    "online": true,
    "busy": false,
  },
].obs;

List<String> availableDays = ["sat"];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          color: CustomColors.mainBlue,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: GNav(
              backgroundColor: CustomColors.mainBlue,
              color: Colors.white,
              activeColor: CustomColors.mainBlue,
              tabBackgroundColor: CustomColors.skyBlue,
              gap: 8,
              onTabChange: (value) {
                setState(() {
                  pageIndex = value;
                });
              },
              padding: EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: "home",
                ),
                GButton(
                  icon: Icons.sports_soccer,
                  text: "activities",
                ),
                GButton(
                  icon: Icons.menu_book_outlined,
                  text: "instructions",
                ),
              ],
            ),
          ),
        ),
        // add an app bar with a leading icon and end icon
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
                  icon: Icon(Icons.person),
                  onPressed: () {},
                ),
                Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                      controller.isAppOwner
                          ? ("${controller.userData!.name} (owner)")
                          : controller.userData?.name ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
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
        body: IndexedStack(
          index: pageIndex,
          children: pages,
        ));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find<AuthController>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: SelectWeekDays(
                    onSelect: (_value) {
                      setState(() {
                        availableDays = _value;
                      });
                      print(_value);
                    },
                    days: _days,
                    unSelectedDayTextColor: CustomColors.mainBlue,
                    selectedDayTextColor: Colors.white,
                    daysFillColor: CustomColors.mainBlue,
                    daysBorderColor: CustomColors.mainBlue,
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: CustomColors.skyBlue,
                    ),
                  ),
                ),
                for (var i in doctorsDummyData)
                  if (i['availableAt']
                      .any((element) => availableDays.contains(element)))
                    DoctorCard(
                      name: "Doctor",
                      position: i['position'],
                      ratingStars: i['ratingStars'],
                      imgPath: i['imgPath'],
                      onTap: () {
                        print(controller.isAppOwner);
                        if (i['online'] && !i['busy']) {
                          if (controller.isAppOwner) {
                            Get.to(
                                ChatPage(
                                  receiverId: "CVpiWRxXy1NHA0mN8eR6Kxekzen2",
                                ),
                                binding: ChatBinding(
                                    'CVpiWRxXy1NHA0mN8eR6Kxekzen2'));
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                Get.to(
                                    ChatPage(
                                      receiverId:
                                          "CVpiWRxXy1NHA0mN8eR6Kxekzen2",
                                    ),
                                    binding: ChatBinding(
                                        'CVpiWRxXy1NHA0mN8eR6Kxekzen2'));
                              },
                            ).show();
                          }
                        } else if (!i['online']) {
                          Get.closeAllSnackbars();

                          Get.snackbar("offline",
                              "doctor is now available at the moment");
                          print("offline");
                        } else if (i['busy']) {
                          Get.closeAllSnackbars();

                          Get.snackbar("busy", "doctor is busy at the moment");
                          print('busy');
                        }
                      },
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  String name;
  String position;
  double ratingStars;
  String imgPath;
  VoidCallback onTap;

  DoctorCard({
    Key? key,
    required this.name,
    required this.position,
    required this.ratingStars,
    required this.imgPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          // add border radius
          decoration: BoxDecoration(
            color: CustomColors.skyBlue,
            borderRadius: BorderRadius.circular(20),
          ),
          // make the width 80% of the width of the screen using getx
          width: Get.width * 0.9,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //  add image from assets and make it looks like a circle
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  backgroundImage: AssetImage(imgPath),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                color: CustomColors.mainBlue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              position,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 8, top: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star_outline,
                                    color: CustomColors.mainBlue,
                                  ),
                                  // text of number of start
                                  Text(
                                    ratingStars.toString(),
                                    style: const TextStyle(
                                      color: CustomColors.mainBlue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
