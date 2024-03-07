// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:budget_tracker/view/home/login.dart';
import 'package:budget_tracker/view/home/splash.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(Duration(seconds: 2), () {
      Get.offNamed("splash1");
    });
    super.onInit();
  }
}
