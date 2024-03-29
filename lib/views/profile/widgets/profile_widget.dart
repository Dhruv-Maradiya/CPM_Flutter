import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/core/extensions/valid_email.dart';
import 'package:projectify/utils/app_utils.dart';
import 'package:projectify/views/common/widgets/dropdown.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../../../preference/shared_preference.dart';

// ignore: must_be_immutable
class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key});
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RefreshIndicator(
          color: Pallets.primaryColor,
          onRefresh: () async => _profileController.fetchProfile(),
          child: Scaffold(
            appBar: CustomAppBar(
              isMenubarToShow: false,
              title: 'Profile',
              backgroundColor: Pallets.appBgColor,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: Pallets.primaryColor,
                  ),
                  onPressed: () => {AppUtils.logoutAlertDialog()},
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            backgroundColor: Pallets.appBgColor,
            body: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Obx(
                        () => _profileController.isImagePicked.value &&
                                _profileController.image != null
                            ? SizedBox(
                                height: 80,
                                width: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(_profileController.image!),
                                ),
                              )
                            : _profileController
                                    .userProfile.value.image.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: CachedNetworkImage(
                                      imageUrl: _profileController
                                          .userProfile.value.url,
                                      height: 80,
                                      width: 80,
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(
                                        color: Pallets.primaryColor,
                                      ),
                                    ),
                                  )
                                : Image.asset(
                                    'assets/images/ellipse_4.png',
                                    height: 80,
                                    width: 80,
                                  ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () => _selectImages(),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Pallets.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(
                              'assets/images/add_photo_4.png',
                              height: 20,
                              width: 20,
                              color: Pallets.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() => Text(
                        _profileController.userProfile.value.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF414141),
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Pallets.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 25),
                          child: Form(
                            key: _formKey,
                            child: Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Enrollment No OR Employee Id
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    _profileController.type.value ==
                                            UserType.student
                                        ? 'Enrollment No.'
                                        : 'Employee Id',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Pallets
                                          .textFieldHelperTextDisabledColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  TextFormField(
                                    controller: _profileController.identifier,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    cursorColor: Pallets.primaryColor,
                                    enableInteractiveSelection: false,
                                    focusNode: AlwaysDisabledFocusNode(),
                                    style: const TextStyle(
                                      color: Pallets
                                          .textFieldHelperTextDisabledColor,
                                    ),
                                    decoration: InputDecoration(
                                      counterText: '',
                                      hintText: 'Ex: 206330307033',
                                      fillColor: Pallets.textFieldBgColor,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Pallets.primaryColor,
                                        ),
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
                                  // Name
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Name',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Pallets.textFieldHelperTextColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  TextFormField(
                                    controller: _profileController.name,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
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
                                    decoration: InputDecoration(
                                      counterText: '',
                                      hintText: 'Ex: Dhruv Maradiya',
                                      fillColor: Pallets.textFieldBgColor,
                                      filled: true,
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
                                  // Phone
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Mobile Number",

                                      contentPadding: EdgeInsets.zero,
                                      prefixIcon: Container(
                                        margin: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Pallets.primaryColor,
                                        ),
                                        height: 58,
                                        width: 58,
                                        child: const Text(
                                          "+91",
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
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
                                    controller: _profileController.phone,
                                    textInputAction: TextInputAction.next,
                                    style: const TextStyle(
                                      color: Pallets
                                          .textFieldHelperTextDisabledColor,
                                    ),
                                    cursorColor: Pallets.primaryColor,
                                    enableInteractiveSelection: false,
                                    focusNode: AlwaysDisabledFocusNode(),
                                  ),
                                  // Email
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Email',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Pallets.textFieldHelperTextColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  TextFormField(
                                    controller: _profileController.email,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
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
                                    decoration: InputDecoration(
                                      counterText: '',
                                      hintText: 'Ex: dhruv@gmail.com',
                                      fillColor: Pallets.textFieldBgColor,
                                      filled: true,
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
                                    height: 10,
                                  ),
                                  UserType.student ==
                                          _profileController.type.value
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Obx(
                                                () => CommonDropDown(
                                                  onChanged: null,
                                                  items: [
                                                    DropdownMenuItem(
                                                      value: _profileController
                                                          .userProfile
                                                          .value
                                                          .branchName,
                                                      child: Text(
                                                        _profileController
                                                                .userProfile
                                                                .value
                                                                .branchName ??
                                                            "",
                                                      ),
                                                    ),
                                                  ],
                                                  hintText: "Branch",
                                                  validator: (val) {
                                                    return null;
                                                  },
                                                  value: _profileController
                                                      .userProfile
                                                      .value
                                                      .branchName,
                                                  label: const Text(
                                                    "Branch Name",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Pallets
                                                          .textFieldHelperTextDisabledColor,
                                                    ),
                                                  ),
                                                ),
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Pallets
                                                          .textFieldHelperTextDisabledColor,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    decoration: InputDecoration(
                                                      hintText: "Sem",
                                                      focusColor: Pallets
                                                          .scaffoldBgColor,
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Pallets
                                                                    .primaryColor,
                                                              )),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Pallets
                                                                    .primaryColor,
                                                              )),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Pallets
                                                                    .primaryColor,
                                                              )),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Pallets
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                      filled: true,
                                                      fillColor: Pallets
                                                          .textFieldBgColor,
                                                    ),
                                                    style: const TextStyle(
                                                      color: Pallets
                                                          .textFieldHelperTextDisabledColor,
                                                    ),
                                                    enableInteractiveSelection:
                                                        false,
                                                    focusNode:
                                                        AlwaysDisabledFocusNode(),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    cursorColor:
                                                        Pallets.primaryColor,
                                                    controller:
                                                        _profileController.sem,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      : const SizedBox.shrink(),
                                  // PASSWORD
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'New Password',
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
                                      controller: _profileController.password,
                                      decoration: InputDecoration(
                                        hintText: "Password",
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
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            _profileController.isObscure.value =
                                                !_profileController
                                                    .isObscure.value;
                                          },
                                          child: Icon(
                                            _profileController.isObscure.value
                                                ? Icons.lock_outline
                                                : Icons.lock_open_outlined,
                                            color: Pallets.primaryColor,
                                          ),
                                        ),
                                      ),
                                      obscureText:
                                          _profileController.isObscure.value,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Pallets.primaryColor,
                                      validator: (value) {
                                        bool isValid = true;
                                        String msg = 'Enter Valid Password.';

                                        if (value!.isEmpty) {
                                          return null;
                                        } else {
                                          RegExp regExp = RegExp(
                                              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%_*?&])[A-Za-z\d@$!%_*?&]{8,}$');
                                          if (!regExp.hasMatch(value)) {
                                            isValid = false;
                                            msg =
                                                "Password must contain at least one uppercase and lowercase letter, one number and one special character.";
                                          }

                                          return isValid ? null : msg;
                                        }
                                      },
                                    ),
                                  ),
                                  // Submit
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _profileController.updateProfile();
                                      }
                                    },
                                    color: Pallets.primaryColor,
                                    height: 52,
                                    minWidth: double.maxFinite,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      'Update',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Pallets.scaffoldBgColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Obx(
          () => _profileController.isLoading.value
              ? AppUtils.getFullScreenLoader()
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  void _selectImages() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      _profileController.addImage(File(image.path));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
