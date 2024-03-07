// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:budget_tracker/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'addinfo.dart';

class LogIn extends StatelessWidget {
  final LogInConToLLer controller = Get.put(LogInConToLLer());

  LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff1F1313),
        leading: CircleAvatar(
            child: Image.asset("assets/icon1.png"),
            backgroundColor: Colors.white),
        title: Text(
          "Expense Tracker",
          style: TextStyle(color: Colors.white),
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
        child: Form(
          key: controller.gKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  child: Image.asset("assets/icon1.png"),
                  backgroundColor: Colors.white,
                  radius: 60),
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height / 3,
                width: MediaQuery.sizeOf(context).width / 1.1,
                decoration: BoxDecoration(
                  color: Color(0xff300E0E),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment(-0.8, 0),
                      child: Text(
                        "Phone Number",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return " *Plz Enter Your phone Number";
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(color: Colors.white),
                        controller: controller.number,
                        decoration: InputDecoration(
                          hintText: "Enter Your Phone Number",
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                          prefix: Text(
                            "+91",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment(-0.8, 0),
                        child: Text(
                          "Password",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return "*Plz Enter Your Password";
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(color: Colors.white),
                        controller: controller.password,
                        decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () {
                            controller.login();
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.brown.shade900),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: controller.registration,
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.brown.shade900),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
