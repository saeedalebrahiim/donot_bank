import 'package:donot_bank/view/components/forms/input.dart';
import 'package:flutter/material.dart';

class OtpConfrimation extends StatefulWidget {
  const OtpConfrimation({super.key, required this.number});
  final String number;

  @override
  State<OtpConfrimation> createState() => _OtpConfrimationState();
}

class _OtpConfrimationState extends State<OtpConfrimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
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
                  "Sending code to ${widget.number}",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Colors.white),
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Not You? Edit",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.white),
                  ),
                ),
                MyInput(
                  label: "OTP",
                  controller: TextEditingController(),
                  validator: (value) {},
                ),
                RawMaterialButton(
                  onPressed: () {},
                  child: Text("Submit"),
                  fillColor: Colors.white,
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
