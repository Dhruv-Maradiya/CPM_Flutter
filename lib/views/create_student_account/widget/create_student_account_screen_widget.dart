import 'package:cpm/core/constants/pallets.dart';
import 'package:flutter/material.dart';

class CreateStudentAccountScreenWidget extends StatefulWidget {
  const CreateStudentAccountScreenWidget({Key? key}) : super(key: key);

  @override
  State<CreateStudentAccountScreenWidget> createState() =>
      _CreateStudentAccountScreenWidgetState();
}

class _CreateStudentAccountScreenWidgetState
    extends State<CreateStudentAccountScreenWidget> {
  bool isObscure = true;

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
                          TextField(
                            decoration: InputDecoration(
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
                          Stack(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Mobile Number",
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
                                  prefix: const SizedBox(width: 58),
                                  fillColor: Pallets.textFieldBgColor,
                                ),
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                cursorColor: Pallets.primaryColor,
                              ),
                              Positioned(
                                  left: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Pallets.primaryColor,
                                    ),
                                    // height: 58,
                                    width: 58,
                                    child: const Text(
                                      "+91",
                                      style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                    ),
                                  )),
                            ],
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
                          TextField(
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
                          TextField(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    TextField(
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
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    TextField(
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
                          TextField(
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
                            ),
                            obscureText: isObscure,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            cursorColor: Pallets.primaryColor,
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
                          TextField(
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
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          MaterialButton(
                            onPressed: () {},
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
                                onTap: () {},
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
