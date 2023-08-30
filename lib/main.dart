import 'package:donot_bank/controller/initializer.dart';
import 'package:donot_bank/controller/provider/card_state.dart';
import 'package:donot_bank/init_screen.dart';
import 'package:donot_bank/model/db/objects/cards.dart';
import 'package:donot_bank/model/db/objects/shops.dart';
import 'package:donot_bank/model/db/objects/transaction.dart';
import 'package:donot_bank/model/db/objects/users.dart';
import 'package:donot_bank/view/pages/transtaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter("donotbank");
  Hive.registerAdapter(UserObjectAdapter());
  Hive.registerAdapter(shopObjectAdapter());
  Hive.registerAdapter(TransactionObjectAdapter());
  Hive.registerAdapter(CardsObjectAdapter());

  initlize();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CardState())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InitScreen(),
    );
  }
}
