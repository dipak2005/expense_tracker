// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:budget_tracker/controller/budgetcontroller.dart';
import 'package:budget_tracker/controller/homecontroller.dart';
import 'package:budget_tracker/model/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddInfo extends StatelessWidget {
  final BudgetController budgetcontroller = Get.put(BudgetController());

  AddInfo({super.key});

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
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Image.asset("assets/icon1.png"),
              ),
              Text(
                "you are just one step away!",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height / 2.5,
                width: MediaQuery.sizeOf(context).width / 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white)),
                child: Form(
                  key: budgetcontroller.globalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.0),
                        child: TextFormField(
                          controller: budgetcontroller.name,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Plz Enter Name";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Enter Your Name",
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Plz Enter Your Income or Expense";
                            } else {
                              return null;
                            }
                          },
                          controller: budgetcontroller.amount,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Income per Month",
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                      ),
                      Obx(
                        () => Align(
                          alignment: Alignment(-0.77, 0),
                          child: DropdownButton(
                            dropdownColor: Color(0xff812626),
                            elevation: 2,
                            value: budgetcontroller.type?.value,
                            items: [
                              DropdownMenuItem(
                                value: "Income",
                                child: Text(
                                  "Income",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Expense",
                                child: Text("Expense",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                            onChanged: (value) {
                              budgetcontroller.type?.value = value ?? "";
                              budgetcontroller.inTVal();
                            },
                          ),
                        ),
                      ),
                      Obx(
                        () {
                          List<String> category = [];
                          if (budgetcontroller.type?.value == "Income") {
                            category = inCategory;
                          } else {
                            category = exCategory;
                          }
                          return Align(
                            alignment: Alignment(-0.78, 0),
                            child: DropdownButton(
                              dropdownColor: Color(0xff812626),
                              hint: Text("Select Category"),
                              value: budgetcontroller.category.value,
                              items: category
                                  .map((e) => DropdownMenuItem(
                                        child: Text(e,
                                            style: TextStyle(color: Colors.white)),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                budgetcontroller.category.value = value ?? "";
                              },
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.0),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: budgetcontroller.note,
                          decoration: InputDecoration(
                            hintText: "Note for Income or Expense",
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 230),
                child: ElevatedButton(
                  onPressed: () {
                    budgetcontroller.fillData();
                  },
                  child: Text(
                    "Let's go",
                    style: TextStyle(color: Colors.brown.shade900),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
