// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:budget_tracker/controller/budgetcontroller.dart';
import 'package:budget_tracker/model/budgetmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Expense extends StatelessWidget {
  final BudgetController exComeController = Get.put(BudgetController());

  Expense({super.key});

  List<String> typeList = ["Income", "Expense"];

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
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment(-0.9, 0),
                  child: Text(
                    "Expense",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height / 3,
                  width: MediaQuery.sizeOf(context).width,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xff551919),
                          Color(0xff812626),
                          Color(0xff300E0E),
                          Color(0xff300E0E),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // SizedBox(
                      //   height: MediaQuery.sizeOf(context).height * 0.08,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 73.0),
                      //     child: ListView.builder(
                      //       itemCount: typeList.length,
                      //       scrollDirection: Axis.horizontal,
                      //       itemBuilder: (BuildContext context, int index) {
                      //         return Container(
                      //           margin: EdgeInsets.only(top: 10),
                      //           decoration: BoxDecoration(
                      //               color: Colors.white,
                      //               borderRadius: BorderRadius.only(
                      //                   topLeft: Radius.circular(20),
                      //                   bottomLeft: Radius.circular(20))),
                      //           child: Container(
                      //             height: 30,
                      //             width: 120,
                      //             decoration: BoxDecoration(
                      //                 color: Colors.orange,
                      //                 borderRadius: BorderRadius.circular(20)),
                      //             child: Center(
                      //               child: Text(
                      //                 typeList[index],
                      //                 style: TextStyle(
                      //                     color: Colors.brown.shade900,
                      //                     fontSize: 20,
                      //                     fontWeight: FontWeight.w500),
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // ),

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
                                            color: Colors.white,
                                            fontSize: 22),
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
                                            color: Colors.white,
                                            fontSize: 22),
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
                            radius: 80,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment(-0.83, 0),
                  child: Text(
                    "Recent Transaction",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Expanded(
                  child: Obx(
                    ()=> RefreshIndicator(
                      onRefresh: () async{
                        exComeController.feaTchData(false);
                      },
                      child: ListView.builder(
                        itemCount: exComeController.exList.length,
                        itemBuilder: (context, index) {
                                BudgetModel expense=exComeController.exList[index];
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
                                  backgroundColor: Colors.black,
                                  radius: 30,
                                ),
                                title: Text(
                                  expense.category??"",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                subtitle: Text(
                                  expense.type??"",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                trailing: Text(
                                  "${expense.amount}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
