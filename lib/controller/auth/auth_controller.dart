import 'package:donot_bank/model/auth/auth_model.dart';
import 'package:donot_bank/view/pages/auth/login.dart';
import 'package:donot_bank/view/pages/auth/otp_conf.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class AuthController {
  static Future<String> login(String phoneNumber, BuildContext context) async {
    AuthModel.login(phoneNumber).then((value) {
      if (value != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OtpConfrimation(number: phoneNumber),
          ),
        );
      } else {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: 'Sorry, something went wrong',
        );
      }
    });
    return "";
  }
}
