import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UserType { student, faculty }

class UserReturn {
  UserReturn({
    required this.userType,
    required this.userId,
    required this.token,
  });
  UserType userType;
  int userId;
  String token;
}

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

  static Future<UserReturn?> getSharePreference() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    int? userId = preference.getInt('userId');
    String? userType = preference.getString('userType');
    String? token = preference.getString('token');

    if (userId != null && userType != null && token != null) {
      return UserReturn(
        userType:
            UserType.values.firstWhere((element) => element.name == userType),
        userId: userId,
        token: token,
      );
    } else {
      return null;
    }
  }
}
