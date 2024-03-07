// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:budget_tracker/controller/budgetcontroller.dart';
import 'package:budget_tracker/model/budgetmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Income extends StatelessWidget {
  final BudgetController incomeController = Get.put(BudgetController());

  Income({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment(-0.9, 0),
              child: Text(
                "Income",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height / 2.4,
              width: MediaQuery.sizeOf(context).width,
              margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xffAC3434),
                  Color(0xff952E2E),
                  Color(0xff792828),
                  Color(0xff642323),
                ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: Icon(Icons.circle_outlined,
                        color: Colors.white, size: 20),
                    title: Text(
                      "Available balance",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    subtitle: Text(
                      "\$ ${0}",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Divider(
                    indent: 30,
                    endIndent: 30,
                    color: Colors.white,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.circle_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Income",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ],
                              ),
                              Text(
                                "0",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.circle_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Expense",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ],
                              ),
                              Text(
                                "42588",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 90,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment(-0.83, 0),
              child: Text(
                "Recent Income",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  incomeController.feaTchData(true);
                },
                child: Obx(
                  () {
                    return ListView.builder(
                      itemCount: incomeController.inList.length,
                      itemBuilder: (context, index) {
                        BudgetModel income = incomeController.inList[index];
                        return Container(
                          height: MediaQuery.sizeOf(context).height / 10,
                          width: MediaQuery.sizeOf(context).width,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  blurStyle: BlurStyle.outer,
                                  offset: Offset(0.98, 0.98))
                            ],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Color(0xff300E0E),
                                radius: 30,
                                child: Text("${income.id}",style: TextStyle(color: Colors.white,fontSize: 25),),
                              ),
                              title: Text(
                                income.category ?? "",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              subtitle: Text(
                                income.name ?? "",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              trailing: Text(
                                "${income.amount}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
