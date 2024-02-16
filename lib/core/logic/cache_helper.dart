import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/login/Model.dart';

class CacheHelper {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> Savecount(int count) async {
    return await _sharedPreferences.setInt("count", count);
  }

  static int Getcount() {
    return _sharedPreferences.getInt("count") ?? 1;
  }

  static Future<bool> Saveimage(String URL) async {
    return await _sharedPreferences.setString("image", URL);
  }

  static String Getimage() {
    return _sharedPreferences.getString("image") ?? "https://www.georgetown.edu/wp-content/uploads/2022/02/Jkramerheadshot-scaled-e1645036825432-1050x1050-c-default.jpg";
  }

  static Future Savelogindata(Userdata user) async {
    await _sharedPreferences.setString("image", user.data!.image);
    await _sharedPreferences.setBool("isActive", user.data!.isActive);
    await _sharedPreferences.setString("token", user.data!.token);
    await _sharedPreferences.setString("phone", user.data!.phone);
    await _sharedPreferences.setString("fullname", user.data!.fullname);
    await _sharedPreferences.setString("country", user.data!.country ?? "");
    await _sharedPreferences.setString("city", user.data!.city ?? "");
    await _sharedPreferences.setString("userType", user.data!.userType);
    await _sharedPreferences.setString(
        "identityNumber", user.data!.identityNumber ?? "");
  }

  static String Getid() {
    return _sharedPreferences.getString("id") ?? "";
  }

  static String Getname() {
    return _sharedPreferences.getString("namme") ?? "";
  }

  static String Getphone() {
    return _sharedPreferences.getString("phone") ?? "";
  }
}
