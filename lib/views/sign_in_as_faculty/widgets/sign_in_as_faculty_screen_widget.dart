import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/utils/app_utils.dart';
import 'package:projectify/views/sign_in_as_faculty/controllers/sign_in_as_faculty_controller.dart';
import 'package:projectify/views/sign_in_as_student/sign_in_as_student_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectify/core/constants/routes.dart';

class SignInAsFacultyScreenWidget extends StatelessWidget {
  SignInAsFacultyScreenWidget({Key? key}) : super(key: key);
  final SignInAsFacultyController signInASFacultyController =
      Get.put(SignInAsFacultyController());

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Pallets.scaffoldBgColor,
          body: SafeArea(
            bottom: false,
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
                                'Employee Id.',
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
                                controller:
                                    signInASFacultyController.employeeId,
                                maxLength: 12,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Employee Id cannot be empty';
                                  }
                                  RegExp regExp = RegExp(r'[0-9]{12}');
                                  if (!regExp.hasMatch(value)) {
                                    return 'Employee Id must be a valid Employee Id';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                cursorColor: Pallets.primaryColor,
                                decoration: InputDecoration(
                                  hintText: 'Type Here...',
                                  filled: true,
                                  fillColor: Pallets.textFieldBgColor,
                                  counterText: '',
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
                              Obx(
                                () => TextFormField(
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password cannot be empty';
                                    }
                                    if (value.length < 8) {
                                      return 'Password must be at least 8 characters';
                                    }
                                    return null;
                                  },
                                  cursorColor: Pallets.primaryColor,
                                  controller:
                                      signInASFacultyController.password,
                                  obscureText:
                                      signInASFacultyController.isObscure.value,
                                  decoration: InputDecoration(
                                    hintText: 'Type Here...',
                                    filled: true,
                                    fillColor: Pallets.textFieldBgColor,
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        signInASFacultyController
                                                .isObscure.value =
                                            !signInASFacultyController
                                                .isObscure.value;
                                      },
                                      child: Icon(
                                        signInASFacultyController
                                                .isObscure.value
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
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    signInASFacultyController
                                        .signInWithEmailAndPassword(context);
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
                                    "Sign in as student. ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Pallets.primaryColor,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.studentSignIn);
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
        ),
        Obx(() => signInASFacultyController.isLoading.value
            ? AppUtils.getFullScreenLoader()
            : const SizedBox.shrink())
      ],
    );
  }
}
