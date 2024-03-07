// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:budget_tracker/controller/budgetcontroller.dart';
import 'package:budget_tracker/controller/homecontroller.dart';
import 'package:budget_tracker/model/util.dart';
import 'package:budget_tracker/view/home/expense.dart';
import 'package:budget_tracker/view/home/income.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExpense extends StatelessWidget {
 final HomeController controller = Get.put(HomeController());

  AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
                color: Color(0xff812626),
                borderRadius: BorderRadius.circular(10)),
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: Colors.transparent,
            tabs: [
              Container(
                height: MediaQuery.sizeOf(context).height / 13,
                width: MediaQuery.sizeOf(context).width / 2.5,
                child: Center(
                  child: Text(
                    "Income",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height / 13,
                width: MediaQuery.sizeOf(context).width / 2.5,
                child: Center(
                  child: Text(
                    "Expense",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ],
            onTap: (value) {},
          ),
          title: Text(
            "Expense Tracker",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xff300E0E),
        ),
        body: TabBarView(
          children: [
            Income(),
            Expense(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.white,
          onPressed: () {
            controller.goto();
          },
          child: Icon(CupertinoIcons.money_dollar,
              color: Colors.brown.shade900, size: 30),
        ),
      ),
    );
  }
}
