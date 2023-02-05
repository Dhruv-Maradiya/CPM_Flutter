import 'dart:convert';

import 'package:cpm/rest/model/base_model.dart';
import 'package:cpm/rest/rest_client.dart';
import 'package:cpm/rest/rest_constants.dart';
import 'package:cpm/views/create_student_account/create_student_account_screen.dart';
import 'package:cpm/views/sign_in_as_faculty/sign_in_as_faculty_screen.dart';
import 'package:cpm/views/sign_in_as_student/models/sign_in_student_model.dart';
import 'package:flutter/material.dart';
import 'package:cpm/core/constants/pallets.dart';

class SignInAsStudentScreenWidget extends StatefulWidget {
  const SignInAsStudentScreenWidget({Key? key}) : super(key: key);

  @override
  State<SignInAsStudentScreenWidget> createState() =>
      _SignInAsStudentScreenWidgetState();
}

class _SignInAsStudentScreenWidgetState
    extends State<SignInAsStudentScreenWidget> {
  bool isObscure = true;
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _enrollmentNo = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallets.scaffoldBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    color: Pallets.secondaryColor,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    color: Pallets.scaffoldBgColor,
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.35,
                      right: 20,
                      left: 20,
                    ),
                    padding: const EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Pallets.scaffoldBgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Enrollment No.',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Pallets.primaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            cursorColor: Pallets.primaryColor,
                            controller: _enrollmentNo,
                            maxLength: 12,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enrollment No cannot be empty';
                              }
                              RegExp regExp = RegExp(r'[0-9]{12}');
                              if (!regExp.hasMatch(value)) {
                                return 'Enrollment No must be a valid Enrollment No';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'Type Here...',
                              fillColor: Pallets.textFieldBgColor,
                              filled: true,
                              suffixIcon: Image.asset(
                                'assets/images/id_card.png',
                                color: Pallets.primaryColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Pallets.primaryColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Pallets.primaryColor),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Pallets.primaryColor),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Pallets.primaryColor),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Pallets.primaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            obscureText: isObscure,
                            cursorColor: Pallets.primaryColor,
                            controller: _password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password cannot be empty';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              fillColor: Pallets.textFieldBgColor,
                              filled: true,
                              hintText: 'Type Here...',
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                child: Icon(
                                  isObscure
                                      ? Icons.lock_outline
                                      : Icons.lock_open_outlined,
                                  color: Pallets.primaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Pallets.primaryColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Pallets.primaryColor),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Pallets.primaryColor),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Pallets.primaryColor),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _signInWithEmailAndPassword(context);
                              }
                            },
                            color: Pallets.primaryColor,
                            height: 52,
                            minWidth: double.maxFinite,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Pallets.scaffoldBgColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have account? ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Pallets.primaryColor,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CreateStudentAccountScreen(),
                                      ),
                                      (_) => false);
                                },
                                child: const Text(
                                  "Create Account",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Pallets.textRedColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Sign in as faculty. ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Pallets.primaryColor,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignInAsFacultyScreen()),
                                      (_) => false);
                                },
                                child: const Text(
                                  "Sign in",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Pallets.textRedColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    // color: Pallets.secondaryColor,
                    child: Image.asset(
                      'assets/images/sign_in.png',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signInWithEmailAndPassword(BuildContext context) async {
    try {
      ApiRequest request = ApiRequest(url: RestConstants.studentSignIn, data: {
        "enrollmentNo": _enrollmentNo.text,
        "password": _password.text,
      });
      final res = await request.post();
      if (res.success) {
        final data = StudentSignInModel.fromJson(res.data).data;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Successfully signed in"),
        ));
      } else {
        final ApiErrorModel apiErrorModel = ApiErrorModel.fromJson(res.error);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(apiErrorModel.message),
        ));
      }
    } catch (e) {
      print(e);
    }
  }
}
