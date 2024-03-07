// ignore_for_file: prefer_const_constructors

import 'package:budget_tracker/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff010101),
            Color(0xff300E0E),
            Color(0xff551919),
            Color(0xff812626),
            Color(0xff300E0E),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Hero(
                tag: "icon",
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/icon1.png",

                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Expense Tracker",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
