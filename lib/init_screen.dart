import 'package:donot_bank/view/pages/auth/login.dart';
import 'package:donot_bank/view/pages/index/index.dart';
import 'package:donot_bank/view/pages/summery/summery.dart';
import 'package:donot_bank/view/pages/transtaction/transaction.dart';
import 'package:flutter/material.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return const Index();
  }
}
