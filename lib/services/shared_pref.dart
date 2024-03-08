import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userProfileKey = "USERPROFILEKEY";

  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userIdKey, getUserId);
  }
  
  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userIdKey, getUserName);
  }
  
  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userIdKey, getUserEmail);
  }
  Future<bool> saveUserProfile(String getUserProfile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userIdKey, getUserProfile);
  }
  
  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }
    Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }
    Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }
      Future<String?> getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userProfileKey);
  }
}
