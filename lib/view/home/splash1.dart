// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash1 extends StatelessWidget {
  const Splash1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1F1313),
        title: CircleAvatar(
          radius: 27,
          backgroundColor: Colors.white,
          child: Image.asset("assets/icon1.png"),
        ),
      ),
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: "welcome",
                    child: Text(
                      "Welcome to\n EXPENSEX.",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  Hero(
                    tag: "aero",
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: IconButton(
                          onPressed: () {
                            Get.offNamed("login");
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 50,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("The best way to track your expenses",style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
