import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled4/app_colors.dart';
import 'package:untitled4/app_images.dart';
import 'package:untitled4/home_page.dart';
import 'package:untitled4/home_page2.dart';

import 'package:untitled4/utility.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  List<String> branchNameList = ['Computer', 'Mechanic', 'Electric', 'comp'];
  TextEditingController _tecFirstName = TextEditingController();
  TextEditingController _tecLastName = TextEditingController();
  TextEditingController _tecEnrollmentno = TextEditingController();
  TextEditingController _tecMobileno = TextEditingController();
  TextEditingController _tecBranchName = TextEditingController();
  TextEditingController _tecPassword = TextEditingController();
  TextEditingController _tecConfirmPassword = TextEditingController();
  TextEditingController _tecSem = TextEditingController();
  String selectedBranch = 'Computer';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        //  mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Welcome',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),

                              Image.asset(AppImages.GroupImg),
                            ],
                          ),
                          Text('to Project Manager',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                          SizedBox(

                          ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                    child: Row(
                    children: [
                    Expanded(

                      child: TextField(
                      controller: _tecFirstName,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                                  fillColor: AppColors.colorD9D9D9.withOpacity(0.49),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                      ),
                    ),
                ),

       ]     )
                ),
                                ],
                              ),
                            ),
                          ],
                        )
      ]      )
        )
    )) );
  }}