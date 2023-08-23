import 'dart:math';

import 'package:donot_bank/model/users/users.dart';

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
    }
    return rndnumber.isNotEmpty ? rndnumber : null;
  }
}
