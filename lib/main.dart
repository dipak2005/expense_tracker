// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:budget_tracker/database/dbhelper.dart';
import 'package:budget_tracker/view/home/addexpense.dart';

import 'package:budget_tracker/view/home/income.dart';
import 'package:budget_tracker/view/home/addinfo.dart';
import 'package:budget_tracker/view/home/login.dart';
import 'package:budget_tracker/view/home/splash.dart';
import 'package:budget_tracker/view/home/splash1.dart';
import 'package:budget_tracker/view/home/expense.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBheLPer().initDatabase();
  runApp(MyBudget());
}

class MyBudget extends StatelessWidget {
  const MyBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      title: "My Budget",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (p0) => Splash(),
        "splash1": (p0) => Splash1(),
        "login": (p0) => LogIn(),
        "addinfo": (p0) => AddInfo(),
        "expense": (p0) => AddExpense(),
        "dash": (p0) => Income(),
        "trans": (p0) => Expense(),
      },
    );
  }
}
