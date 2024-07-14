import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add this line
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:mindmates/chatRooms.dart';
import 'package:mindmates/home.dart';
import 'package:mindmates/models/user.dart';
import 'package:mindmates/constants/mycolors.dart';
import 'package:mindmates/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  SharedPreferences? prefs;

  final Rx<User?> _firebaseUser = Rx<User?>(null);
  String? get user => _firebaseUser.value?.email;

  final Rx<UserData?> _userData = UserData().obs;
  UserData? get userData => _userData.value;

  final Rx<bool> _isAppOwner = false.obs;
  bool get isAppOwner => _isAppOwner.value;

  @override
  void onInit() async {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
    prefs = await SharedPreferences.getInstance();

    String? email = await prefs?.getString("email");
    String? password = await prefs?.getString("password");
    print(email);
    print(password);
    if (await _userIsSaved()) {
      login(email!, password!);
    } else {
      logout();
    }
  }

  Future<bool> _userIsSaved() async {
    String? email = await prefs?.getString("email");
    String? password = await prefs?.getString("password");

    return email != null && password != null;
  }

  void createUser(
      {required String email,
      required String password,
      required String confirmPassword,
      required String name,
      required String phone}) async {
    final _db = FirebaseFirestore.instance;
    try {
      const spinkit = SpinKitPulsingGrid(
        color: Colors.white,
        size: 50.0,
      );

      Get.dialog(
        spinkit,
        barrierDismissible: false,
      );

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? _user = userCredential.user;

      await _db.collection('users').add({
        'email': email,
        'uid': _user?.uid,
        'name': name,
        'phone': phone,
        'add_time': DateTime.now(),
      });

      _userData.value = new UserData(
        email: email,
        name: name,
        phone: phone,
        uid: _user?.uid,
      );

      Get.back();

      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'login successful',
        desc: 'you are now logged in',
        btnOkOnPress: () {},
      ).show();

      if (await _userIsSaved()) {
        await _saveUserDataOnDevice(email, password);
      }

      Get.offAll(HomePage());
    } catch (e) {
      print(e.toString());
      Get.back();

      AwesomeDialog(
              context: Get.context!,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'invalid credentials',
              desc: 'wrong sign up data',
              btnOkOnPress: () {},
              btnOkColor: Colors.red)
          .show();
    }
  }

  Future<void> _saveUserDataOnDevice(email, password) async {
    await prefs?.setString('email', email);
    await prefs?.setString('password', password);
  }

  Future<void> _removeUserDataFromDevice() async {
    await prefs?.remove('email');
    await prefs?.remove('password');
  }

  void login(String email, String password) async {
    final _db = FirebaseFirestore.instance;

    try {
      const spinkit = SpinKitPulsingGrid(
        color: Colors.white,
        size: 50.0,
      );

      Get.dialog(
        spinkit,
        barrierDismissible: false,
      );

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User? _user = userCredential.user;

      // query the users collection with a (where) condition
      QuerySnapshot querySnapshot = await _db
          .collection('users')
          .where('uid', isEqualTo: _user?.uid)
          .get();

      print(querySnapshot.docs[0]['name']);

      _userData.value = new UserData(
        email: querySnapshot.docs[0]['email'],
        name: querySnapshot.docs[0]['name'],
        phone: querySnapshot.docs[0]['phone'],
        uid: querySnapshot.docs[0]['uid'],
      );

      if (_userData.value?.email == "nourmasoud17@gmail.com") {
        _isAppOwner.value = true;
      } else if (_userData.value?.email == "esoo22288@gmail.com") {
        _isAppOwner.value = true;
      } else if (_userData.value?.email == "mhasenmagdy69@gmail.com") {
        _isAppOwner.value = true;
      } else if (_userData.value?.email == "rewandiaf@gmail.com") {
        _isAppOwner.value = true;
      } else if (_userData.value?.email == "mashallahayman@gmail.com") {
        _isAppOwner.value = true;
      } else if (_userData.value?.email == "dodiadel384@gmail.com") {
        _isAppOwner.value = true;
      } else {
        _isAppOwner.value = false;
      }
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'login successful',
        desc: 'you are now logged in',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      ).show();
      Get.back();

      if (!await _userIsSaved()) {
        await _saveUserDataOnDevice(email, password);
      }

      if (_userData.value?.uid != "CVpiWRxXy1NHA0mN8eR6Kxekzen2") {
        Get.offAll(HomePage());
      } else {
        Get.offAll(ChatRooms());
      }
    } catch (e) {
      Get.back();
      print(e.toString());
      AwesomeDialog(
              context: Get.context!,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'invalid credentials',
              desc: 'wrong username or password',
              btnOkOnPress: () {},
              btnOkColor: Colors.red)
          .show();
    }
  }

  void logout() async {
    const spinkit = SpinKitPulsingGrid(
      color: Colors.white,
      size: 50.0,
    );

    Get.dialog(
      spinkit,
      barrierDismissible: false,
    );

    await _auth.signOut();

    await _removeUserDataFromDevice();
    Get.back();

    Get.offAll(WelcomePage());
  }

  Future<List> getAllUsers() async {
    final _db = FirebaseFirestore.instance;

    try {
      QuerySnapshot querySnapshot = await _db.collection('users').get();
      var usersList = [];
      querySnapshot.docs.forEach((element) {
        usersList.add(element.data());
      });
      return usersList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
