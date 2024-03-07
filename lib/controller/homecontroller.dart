// ignore_for_file: prefer_const_constructors

import 'package:budget_tracker/controller/login_controller.dart';
import 'package:budget_tracker/view/home/addexpense.dart';
import 'package:budget_tracker/view/home/addinfo.dart';

import 'package:budget_tracker/view/home/income.dart';
import 'package:budget_tracker/view/home/expense.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController {
  void goto() {
    Get.to(() => AddInfo());
  }
}
