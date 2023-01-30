import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/adminscreen.dart';
import 'package:untitled4/app_colors.dart';
import 'package:untitled4/app_images.dart';
import 'package:untitled4/register.dart';
import 'package:untitled4/utility.dart';
import 'package:http/http.dart' as http;
import 'package:untitled4/welcomescreen.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController _tecEnNo = TextEditingController();
  TextEditingController _tecPassword = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Image.asset(AppImages.loginImg),
                SizedBox(height: 40,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Login..',
                      style: TextStyle(
                        fontSize: 36,fontWeight: FontWeight.bold
                      )),
                ),
                SizedBox(height: 26,),
                textfield,
                SizedBox(
                  height: 35,
                ),
                textfield1,
                SizedBox(
                  height: 35,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_tecEnNo.text.trim().isEmpty) {
                        showInSnackBar('Please enter en no');
                      } else if (_tecPassword.text.trim().isEmpty) {
                        showInSnackBar('Please enter password');
                      } else {
                        login(context);
                      }
                    },
                    child: Text('Sign In',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color:Colors.white)),
                  ),

                ),
                new RichText(
                  text: new TextSpan(
                      text: ' Don\'t have account ?',
                      style: TextStyle(color: Colors.black),
                      children: [
                        new TextSpan(
                          text: 'Create Account.',
                          style: TextStyle(color: AppColors.color3231C3),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Register()),
                              );
                            },
                        )
                      ]),
                ),
                new RichText(
                  text: new TextSpan(
                      text: ' Don\'t have account ?',
                      style: TextStyle(color: Colors.black),
                      children: [
                        new TextSpan(
                          text: 'Login.',
                          style: TextStyle(color: AppColors.color3231C3),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AdminScreen()),
                              );
                            },
                        )
                      ]),
                )
              ])),
        ));
  }

  Widget get textfield => Column(
    children: [SizedBox(width: 5,),Align(
      alignment: Alignment.topLeft,
      child: Text('Enrollment no',
          style: TextStyle(
              fontSize: 18,fontWeight: FontWeight.bold
          )),
    ),

      TextField(
        controller: _tecEnNo,
        decoration: InputDecoration(

          contentPadding: EdgeInsets.symmetric(vertical: 5),

          fillColor: AppColors.colorD9D9D9.withOpacity(0.49),
          filled: true,
          prefixIcon: Icon(Icons.contact_mail_sharp),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(11.0),
          ),
        ),
      ),
    ],
  );

  void showInSnackBar(String value) {
    var showSnackBar = _scaffoldKey.currentState!.showSnackBar(new SnackBar(
      content: new Text(value),
      backgroundColor: Colors.red,
    ));
  }

  Widget get textfield1 => Column(
    children: [  Align(
      alignment: Alignment.topLeft,
      child: Text('Password',
          style: TextStyle(
              fontSize: 18,fontWeight: FontWeight.bold
          )),
    ),      TextField(
        controller: _tecPassword,
        decoration: InputDecoration(

          contentPadding: EdgeInsets.symmetric(vertical: 5),

          fillColor: AppColors.colorD9D9D9.withOpacity(0.49), 
          filled: true,
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    ],
  );

  void login(BuildContext context) async {
    Utils(context).startLoading();
    var request = http.Request(
        'POST', Uri.parse('http://193.168.195.86:3001/api/v1/student/login'));
    request.body = json.encode({
      "enrollementNo": _tecEnNo.text.trim(),
      "password": _tecPassword.text.trim()
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      Utils(context).stopLoading();

      if (jsonDecode(res)['status'] == 'success') {

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
      }

      //      print(await response.stream.bytesToString());
    } else {
      var res = await response.stream.bytesToString();

      showInSnackBar(jsonDecode(res)['message']);
      Utils(context).stopLoading();

      //      print('error ${response.statusCode}');
    }
  }
}