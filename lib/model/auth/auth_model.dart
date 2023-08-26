import 'dart:math';

import 'package:donot_bank/model/users/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthModel {
  static Future<String?> login(String phoneNumber) async {
    bool hasUser = users.any((element) => element == phoneNumber);
    var rndnumber = "";

    if (hasUser) {
      var rnd = Random();
      for (var i = 0; i < 6; i++) {
        rndnumber = rndnumber + rnd.nextInt(9).toString();
      }
      print(rndnumber);
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString("OTP", rndnumber);
    }
    return rndnumber.isNotEmpty ? rndnumber : null;
  }
////////////////////////////////////////////////////

  static Future<bool?> otpconf(String otp) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String systemotp = sp.getString("OTP").toString();
    bool result = systemotp == otp;

    return result;
  }
}
