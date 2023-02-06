import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UserType { student, faculty }

class SharedPreferencesClass {
  static addSharePreference(
    int userId,
    UserType userType,
    String token,
  ) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setInt('userId', userId);
    preference.setString('userType', userType.name);
    preference.setString('token', token);
  }

  static getSharePreference() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    int? userId = preference.getInt('userId');
    String? userType = preference.getString('userType');
    String? token = preference.getString('token');

    return {
      'userId': userId,
      'userType': userType,
      'token': token,
    };
  }
}
