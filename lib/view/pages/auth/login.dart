import 'package:donot_bank/controller/auth/auth_controller.dart';
import 'package:donot_bank/view/components/forms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var controller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff673ab7),
              Color(0xff4caf50),
              Colors.yellow,
            ],
            stops: [0, 0.8, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Login",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Colors.white),
                ),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formkey,
                  child: MyInput(
                    label: "Phone Number",
                    controller: controller,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "khali nabash";
                      }
                      if (value.startsWith("09") == false) {
                        return "ba 09 shoru kon";
                      }
                      if (value.length > 11 || value.length < 11) {
                        return "11 ta bashe";
                      }
                      return null;
                    },
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      AuthController.login(controller.text, context);
                    }
                  },
                  fillColor: Colors.white,
                  child: const Text("Send OTP"),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
