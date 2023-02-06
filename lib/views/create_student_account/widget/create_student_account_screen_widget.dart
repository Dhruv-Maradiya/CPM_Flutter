import 'package:cpm/core/constants/pallets.dart';
import 'package:cpm/views/create_student_account/controllers/create_student_account_controller.dart';
import 'package:cpm/views/create_student_account/controllers/get_branch_controller.dart';
import 'package:cpm/views/sign_in_as_student/sign_in_as_student_screen.dart';
import 'package:flutter/material.dart';
import 'package:cpm/core/extensions/valid_email.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class CreateStudentAccountScreenWidget extends StatefulWidget {
  const CreateStudentAccountScreenWidget({Key? key}) : super(key: key);

  @override
  State<CreateStudentAccountScreenWidget> createState() =>
      _CreateStudentAccountScreenWidgetState();
}

class _CreateStudentAccountScreenWidgetState
    extends State<CreateStudentAccountScreenWidget> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final CreateStudentAccountController _createStudentAccountController =
      Get.put(CreateStudentAccountController());
  final GetBranchController _getBranchController =
      Get.put(GetBranchController());

  @override
  void initState() {
    super.initState();
    _getBranchController.getBranches(context);
  }

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
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width,
                      color: Pallets.secondaryColor,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width,
                      color: Pallets.scaffoldBgColor,
                    )
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Pallets.scaffoldBgColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: MediaQuery.of(context).size.height * 0.28,
                      ),
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 30, bottom: 30),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Enrollment Number
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Enrollment No.',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Pallets.primaryColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              validator: (value) {
                                bool isValid = true;
                                String msg = 'Enter Valid Enrollment No.';

                                if (value!.isEmpty) {
                                  isValid = false;
                                }
                                RegExp regExp = RegExp(r'[0-9]{12}');
                                if (!regExp.hasMatch(value)) {
                                  isValid = false;
                                }

                                return isValid ? null : msg;
                              },
                              maxLength: 12,
                              controller:
                                  _createStudentAccountController.enrollmentNo,
                              decoration: InputDecoration(
                                counterText: "",
                                hintText: "Enrollment No.",
                                focusColor: Pallets.scaffoldBgColor,
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Pallets.primaryColor,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Pallets.primaryColor,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Pallets.primaryColor,
                                    )),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Pallets.primaryColor,
                                    )),
                                filled: true,
                                fillColor: Pallets.textFieldBgColor,
                              ),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              cursorColor: Pallets.primaryColor,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            // MOBILE NUMBER

                            TextFormField(
                              controller: _createStudentAccountController.phone,
                              decoration: InputDecoration(
                                hintText: "Mobile Number",
                                contentPadding: EdgeInsets.zero,
                                prefixIcon: Container(
                                  margin: const EdgeInsets.only(
                                    right: 10,
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Pallets.primaryColor,
                                  ),
                                  height: 58,
                                  width: 58,
                                  child: const Text(
                                    "+91",
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                focusColor: Pallets.scaffoldBgColor,
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Pallets.primaryColor,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Pallets.primaryColor,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Pallets.primaryColor,
                                    )),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Pallets.primaryColor,
                                  ),
                                ),
                                filled: true,
                                // prefix: const SizedBox(width: 58),
                                fillColor: Pallets.textFieldBgColor,
                              ),
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              cursorColor: Pallets.primaryColor,
                              validator: (value) {
                                bool isValid = true;
                                String msg = 'Enter Valid Mobile Number.';

                                if (value!.isEmpty) {
                                  isValid = false;
                                }
                                RegExp regExp = RegExp(r'[0-9]{10}$');
                                if (!regExp.hasMatch(value)) {
                                  isValid = false;
                                }

                                return isValid ? null : msg;
                              },
                            ),

                            // NAME
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Name',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Pallets.primaryColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _createStudentAccountController.name,
                              decoration: InputDecoration(
                                hintText: "Name",
                                focusColor: Pallets.scaffoldBgColor,
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Pallets.primaryColor,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Pallets.primaryColor,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Pallets.primaryColor,
                                    )),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Pallets.primaryColor,
                                  ),
                                ),
                                filled: true,
                                fillColor: Pallets.textFieldBgColor,
                              ),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              cursorColor: Pallets.primaryColor,
                              validator: (value) {
                                bool isValid = true;
                                String msg = 'Enter Valid Name.';

                                if (value!.isEmpty) {
                                  isValid = false;
                                }
                                final regExp = RegExp(r"[A-Za-z]$");
                                if (!regExp.hasMatch(value)) {
                                  isValid = false;
                                  msg = "Name can only contain letters.";
                                }
                                if (value.length < 2) {
                                  isValid = false;
                                  msg =
                                      "Name can not be less than 2 characters.";
                                }
                                return isValid ? null : msg;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // EMAIL
                            const Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Pallets.primaryColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _createStudentAccountController.email,
                              decoration: InputDecoration(
                                hintText: "Email",
                                focusColor: Pallets.scaffoldBgColor,
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Pallets.primaryColor,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Pallets.primaryColor,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Pallets.primaryColor,
                                    )),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Pallets.primaryColor,
                                  ),
                                ),
                                filled: true,
                                fillColor: Pallets.textFieldBgColor,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              enableSuggestions: false,
                              textInputAction: TextInputAction.next,
                              cursorColor: Pallets.primaryColor,
                              validator: (value) {
                                bool isValid = true;
                                String msg = 'Enter Valid Email.';

                                if (value!.isEmpty) {
                                  isValid = false;
                                }
                                if (!value.isValidEmail()) {
                                  isValid = false;
                                }

                                return isValid ? null : msg;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Branch Name',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Pallets.primaryColor),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            _createStudentAccountController
                                                .branch,
                                        decoration: InputDecoration(
                                          hintText: "Branch",
                                          focusColor: Pallets.scaffoldBgColor,
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Pallets.primaryColor,
                                              )),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Pallets.primaryColor,
                                              )),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Pallets.primaryColor,
                                              )),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: Pallets.primaryColor,
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: Pallets.textFieldBgColor,
                                        ),
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.next,
                                        cursorColor: Pallets.primaryColor,
                                        validator: (value) {
                                          bool isValid = true;
                                          String msg = 'Select valid Branch.';

                                          if (value!.isEmpty) {
                                            isValid = false;
                                          }

                                          return isValid ? null : msg;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Sem',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Pallets.primaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            _createStudentAccountController.sem,
                                        decoration: InputDecoration(
                                          hintText: "Sem",
                                          focusColor: Pallets.scaffoldBgColor,
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Pallets.primaryColor,
                                              )),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Pallets.primaryColor,
                                              )),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Pallets.primaryColor,
                                              )),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: Pallets.primaryColor,
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: Pallets.textFieldBgColor,
                                        ),
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.next,
                                        cursorColor: Pallets.primaryColor,
                                        validator: (value) {
                                          bool isValid = true;
                                          String msg = 'Select valid Sem.';

                                          if (value!.isEmpty) {
                                            isValid = false;
                                          }

                                          return isValid ? null : msg;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // PASSWORD
                            const Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Pallets.primaryColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Obx(
                              () => TextFormField(
                                controller:
                                    _createStudentAccountController.password,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  focusColor: Pallets.scaffoldBgColor,
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Pallets.primaryColor,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Pallets.primaryColor,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Pallets.primaryColor,
                                      )),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Pallets.primaryColor,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Pallets.textFieldBgColor,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      _createStudentAccountController
                                              .isObscure.value =
                                          !_createStudentAccountController
                                              .isObscure.value;
                                    },
                                    child: Icon(
                                      _createStudentAccountController
                                              .isObscure.value
                                          ? Icons.lock_outline
                                          : Icons.lock_open_outlined,
                                      color: Pallets.primaryColor,
                                    ),
                                  ),
                                ),
                                obscureText: _createStudentAccountController
                                    .isObscure.value,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                cursorColor: Pallets.primaryColor,
                                validator: (value) {
                                  bool isValid = true;
                                  String msg = 'Enter Valid Password.';

                                  if (value!.isEmpty) {
                                    isValid = false;
                                  }
                                  RegExp regExp = RegExp(
                                      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');
                                  if (!regExp.hasMatch(value)) {
                                    isValid = false;
                                    msg =
                                        "Password must contain at least one uppercase and lowercase letter, one number and one special character.";
                                  }

                                  return isValid ? null : msg;
                                },
                              ),
                            ),
                            // CONFIRM PASSWORD
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Confirm Password',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Pallets.primaryColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                                controller: _createStudentAccountController
                                    .confirmPassword,
                                decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  focusColor: Pallets.scaffoldBgColor,
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Pallets.primaryColor,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Pallets.primaryColor,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Pallets.primaryColor,
                                      )),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Pallets.primaryColor,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Pallets.textFieldBgColor,
                                ),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                cursorColor: Pallets.primaryColor,
                                obscureText: true,
                                validator: (value) {
                                  bool isValid = true;
                                  String msg =
                                      'Confirm Password must be same as password.';

                                  if (value!.isEmpty) {
                                    isValid = false;
                                  }
                                  // ignore: unrelated_type_equality_checks
                                  if (_createStudentAccountController
                                          .password.value.text !=
                                      value) {
                                    isValid = false;
                                  }

                                  return isValid ? null : msg;
                                }),
                            const SizedBox(
                              height: 40,
                            ),
                            MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                }
                              },
                              color: Pallets.primaryColor,
                              height: 52,
                              minWidth: double.maxFinite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'Sign Up',
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
                                  "If you already have account? ",
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
                                              const SignInAsStudentScreen(),
                                        ),
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
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      padding: const EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/sign_up.png'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
