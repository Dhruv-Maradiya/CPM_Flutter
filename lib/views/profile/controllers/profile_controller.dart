import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/preference/shared_preference.dart';
import 'package:projectify/views/profile/providers/profile_provider.dart';

class UserProfile {
  int id;
  String name;
  String email;
  String phone;
  String image;
  String identifier;
  int? sem;
  String? branchName;
  String url;
  UserType type;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.identifier,
    this.sem,
    this.branchName,
    required this.type,
    required this.url,
  });
}

class ProfileController extends GetxController {
  TextEditingController identifier = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController branchName = TextEditingController();
  TextEditingController sem = TextEditingController();
  TextEditingController password = TextEditingController();

  Rx<UserProfile> userProfile = UserProfile(
    name: '',
    email: '',
    phone: '',
    image: '',
    identifier: '',
    sem: 0,
    branchName: '',
    type: UserType.none,
    id: 0,
    url: '',
  ).obs;

  RxBool isObscure = true.obs;
  RxBool isLoading = false.obs;

  Rx<UserType> type = UserType.none.obs;

  File? image;
  RxBool isImagePicked = false.obs;

  @override
  void onInit() async {
    super.onInit();
    var data = await SharedPreferencesClass.getSharePreference();
    if (data != null) {
      type.value = data.userType;
      fetchProfile();
    }
  }

  void fetchProfile() async {
    UserReturn? user = await SharedPreferencesClass.getSharePreference();

    if (user == null) {
      return Get.back();
    }
    isLoading.value = true;
    if (user.userType == UserType.student) {
      var data =
          await ProfileProvider().fetchStudentProfile(studentId: user.userId);
      if (data != null) {
        name.text = data.data.name;
        email.text = data.data.email;
        identifier.text = data.data.enrollmentNo;
        phone.text = data.data.number;
        branchName.text = data.data.branch.displayName;
        sem.text = data.data.semester.toString();

        userProfile.value = UserProfile(
          id: data.data.id,
          name: data.data.name,
          email: data.data.email,
          phone: data.data.number,
          image: data.data.profilePicture,
          identifier: data.data.enrollmentNo,
          sem: data.data.semester,
          branchName: data.data.branch.displayName,
          url: data.data.url,
          type: UserType.student,
        );
      }
    } else if (user.userType == UserType.faculty) {
      var data =
          await ProfileProvider().fetchFacultyProfile(facultyId: user.userId);
      if (data != null) {
        name.text = data.data.name;
        email.text = data.data.email;
        identifier.text = data.data.employeeId;
        phone.text = data.data.number;

        userProfile.value = UserProfile(
          id: data.data.id,
          name: data.data.name,
          email: data.data.email,
          phone: data.data.number,
          image: data.data.profilePicture,
          identifier: data.data.employeeId,
          type: UserType.faculty,
          url: data.data.url,
        );
      }
    }
    image = null;
    isImagePicked.value = false;
    isLoading.value = false;
  }

  void updateProfile() async {
    isLoading.value = true;
    if (userProfile.value.type == UserType.student) {
      var data;
      if (image != null) {
        var body = await dio.MultipartFile.fromFile(image!.path,
            filename: image!.path.split('/').last);
        var formData = dio.FormData.fromMap({
          "file": body,
          "id": userProfile.value.id,
          "name": name.text,
          "email": email.text,
          ...password.text.isEmpty ? {} : {"password": password.text.isEmpty},
        });
        data = await ProfileProvider().updateStudentProfile(
          data: formData,
        );
      } else {
        data = await ProfileProvider().updateStudentProfile(
          data: {
            "id": userProfile.value.id,
            "name": name.text,
            "email": email.text,
            ...password.text.isEmpty ? {} : {"password": password.text},
          },
        );
      }
      if (data != null) {
        name.text = data.data.name;
        email.text = data.data.email;
        identifier.text = data.data.enrollmentNo;
        phone.text = data.data.number;
        branchName.text = data.data.branch.displayName;
        sem.text = data.data.semester.toString();
        userProfile.value = UserProfile(
          id: data.data.id,
          name: data.data.name,
          email: data.data.email,
          phone: data.data.number,
          image: data.data.profilePicture,
          identifier: data.data.enrollmentNo,
          sem: data.data.semester,
          branchName: data.data.branch.displayName,
          type: UserType.student,
          url: data.data.url,
        );
        Get.snackbar(
          "Success",
          "Profile Updated Successfully",
          backgroundColor: Pallets.successColor,
          isDismissible: true,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else if (userProfile.value.type == UserType.faculty) {
      var data = await ProfileProvider().updateFacultyProfile(data: {
        "id": userProfile.value.id,
        "name": name.text,
        "email": email.text,
        ...password.text.isEmpty ? {} : {"password": password.text.isEmpty},
      });
      if (data != null) {
        name.text = data.data.name;
        email.text = data.data.email;
        identifier.text = data.data.employeeId;
        phone.text = data.data.number;
        userProfile.value = UserProfile(
          id: data.data.id,
          name: data.data.name,
          email: data.data.email,
          phone: data.data.number,
          image: data.data.profilePicture,
          identifier: data.data.employeeId,
          type: UserType.faculty,
          url: data.data.url,
        );
      }
    }
    isLoading.value = false;
  }

  void addImage(File img) async {
    image = img;
    isImagePicked.value = true;
    isImagePicked.refresh();
  }
}
