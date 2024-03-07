// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:budget_tracker/database/dbhelper.dart';
import 'package:budget_tracker/model/usermodel.dart';
import 'package:budget_tracker/view/home/addexpense.dart';
import 'package:budget_tracker/view/home/addinfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInConToLLer extends GetxController {
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> gKey = GlobalKey<FormState>();

  Future<void> login() async {
    DBheLPer db = DBheLPer();
    var userFound = await db.getUser(number.text, password.text);
    if (gKey.currentState?.validate() ?? false) {
      if (userFound?.isEmpty ?? false) {
        Get.showSnackbar(
          GetSnackBar(
            backgroundColor: Colors.red,
            borderRadius: 20,
            title: "Error",
            duration: Duration(seconds: 2),
            message: "User Not Found",
          ),
        );
      } else {
        Get.off(() => AddExpense());
      }
    }
  }

  Future registration() async {
    DBheLPer db = DBheLPer();
    List<Map<String, Object?>>? userFound =
        await db.getUser(number.text, password.text);
    if (userFound?.isEmpty ?? false) {
      db.insertUserData(
        UserModel(
          number: number.text,
          password: password.text,
        ),
      );
      Get.off(() => AddInfo());
    } else {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        title: "Error",
        message: "User Already Exist",
      ));
    }
  }
}
