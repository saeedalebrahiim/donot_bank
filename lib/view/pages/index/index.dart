import 'package:donot_bank/controller/provider/card_state.dart';
import 'package:donot_bank/model/db/boxes/boxes.dart';
import 'package:donot_bank/model/db/objects/users.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_listener/hive_listener.dart';
import 'package:provider/provider.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBox();
  }

  getBox() async {
    context.read<CardState>().getCard();

    Boxes.userBox = await Hive.openBox("userBox");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            context.read<CardState>().getCard();
          },
          icon: Icon(
            Icons.add_circle,
            size: 28,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    HiveListener<dynamic>(
                      box: Boxes.userBox,
                      builder: (box) {
                        return Text(
                          box.values.first.userName,
                          style: Theme.of(context).textTheme.headlineLarge,
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Welcome to donot bank",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<CardState>(
                  builder: (context, value, child) => Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 450,
                        height: 120,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade50,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  color: Colors.black),
                              child: Icon(
                                Icons.wallet,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Balance",
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14),
                                ),
                                Text(
                                  CardState.card != null
                                      ? "\$${CardState.card!.balance}"
                                      : "Not found",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 100,
                        bottom: 0,
                        child: Container(
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              opacity: 0.3,
                              image: AssetImage("lib/assets/favicon.png"),
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                            color: Colors.deepOrange[300],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                CardState.card != null
                                    ? CardState.card!.cardNumber
                                    : "********",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Exp:",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    CardState.card != null
                                        ? CardState.card!.exDate
                                        : "-  -",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transactions",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      child: Text(
                        "More",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        width: 450,
                        height: 90,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 130,
                                  height: 110,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.black),
                                  child: FlutterLogo(),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Shop folan",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Aug 06 2020",
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              "-\$14.0",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
