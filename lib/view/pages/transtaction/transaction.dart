import 'package:donot_bank/model/db/boxes/boxes.dart';
import 'package:donot_bank/model/db/objects/cards.dart';
import 'package:donot_bank/model/db/objects/transaction.dart';
import 'package:donot_bank/view/pages/index/index.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class TransAction extends StatefulWidget {
  const TransAction({super.key});

  @override
  State<TransAction> createState() => _TransActionState();
}

class _TransActionState extends State<TransAction> {
  TextEditingController numctr = TextEditingController();
  double dx = 0;
  int? dropvalue;
  bool radiovalue = true;
  String lorem = "HEH";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: const Text(
          "Submit Money",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 450,
                height: 50,
                child: WheelChooser.custom(
                  onValueChanged: (s) {
                    switch (s) {
                      case 1:
                        setState(() {
                          lorem = "Nike";
                        });
                      case 2:
                        setState(() {
                          lorem = "addidassss";
                        });
                      case 3:
                        setState(() {
                          lorem = "puuuuuma";
                        });
                      default:
                        setState(() {
                          lorem = "HEH";
                        });
                    }
                  },
                  horizontal: true,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   width: 450,
              //   height: 100,
              //   child: ListView(
              //     padding: EdgeInsets.symmetric(horizontal: 25),
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: CircleAvatar(),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: CircleAvatar(),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: CircleAvatar(),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: CircleAvatar(),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: CircleAvatar(),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: CircleAvatar(),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: CircleAvatar(),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: CircleAvatar(),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: CircleAvatar(),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: CircleAvatar(),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: CircleAvatar(),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: CircleAvatar(),
              //       ),
              //     ],
              //     scrollDirection: Axis.horizontal,
              //   ),
              // ),
              Text(
                lorem,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 171,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(35)),
                child: DropdownButton(
                    hint: const Text("Please Choose Card"),
                    items: const [
                      DropdownMenuItem(value: 1, child: Text("data")),
                      DropdownMenuItem(
                        value: 2,
                        child: Text("sfsf"),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text("fasf"),
                      ),
                      DropdownMenuItem(
                        value: 4,
                        child: Text("gdfgd"),
                      ),
                    ],
                    value: dropvalue,
                    onChanged: (a) {
                      dropvalue = a!;
                      setState(() {});
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              RadioListTile(
                  title: const Text("Deposite"),
                  value: true,
                  groupValue: radiovalue,
                  onChanged: (newval) {
                    setState(() {
                      radiovalue = newval!;
                    });
                  }),
              RadioListTile(
                  title: const Text("Withdraws"),
                  value: false,
                  groupValue: radiovalue,
                  onChanged: (newval) {
                    setState(() {
                      radiovalue = newval!;
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  controller: numctr,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 450,
                height: 300,
                decoration: const BoxDecoration(color: Colors.black),
                child: GridView.builder(
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1.9),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        if (index == 11) {
                          String vv =
                              numctr.text.substring(0, numctr.text.length - 1);
                          numctr.text = vv;
                        } else {
                          numctr.text = numctr.text +
                              (index == 9
                                  ? "."
                                  : index == 10
                                      ? "0"
                                      : (index + 1).toString());
                        }
                      },
                      child: index == 11
                          ? const Icon(
                              Icons.backspace,
                              color: Colors.white,
                            )
                          : Text(
                              index == 9
                                  ? "."
                                  : index == 10
                                      ? "0"
                                      : ((index) + 1).toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30),
                            ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                    width: 350,
                    height: 40,
                    color: Colors.black,
                  ),
                  Positioned(
                    bottom: 0,
                    left: dx,
                    child: GestureDetector(
                      onHorizontalDragEnd: (details) async {
                        Boxes.transactionBox =
                            await Hive.openBox("transactionBox");
                        Boxes.shopBox = await Hive.openBox("shopBox");
                        Boxes.cardBox = await Hive.openBox("cardBox");

                        if (dx >= 250) {
                          var oldData = Boxes.cardBox.values.last;
                          var index = Boxes.cardBox.length - 1;
                          var oldvalue =
                              int.parse(Boxes.cardBox.values.last.balance);
                          var newamount = radiovalue
                              ? oldvalue + int.parse(numctr.text)
                              : oldvalue - int.parse(numctr.text);
                          Boxes.cardBox.putAt(
                              index,
                              CardsObject(
                                  balance: newamount.toString(),
                                  exDate: oldData.exDate,
                                  cardNumber: oldData.cardNumber,
                                  id: oldData.id,
                                  userId: oldData.userId));
                          Boxes.transactionBox.add(TransactionObject(
                            id: const Uuid().v1(),
                            amount: "${numctr.text}\$",
                            dateTime: DateTime.now().toString(),
                            isDeposite: radiovalue,
                            shopId: Boxes.shopBox.values.first.id,
                            cardId: Boxes.cardBox.values.last.id,
                          ));
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Index(),
                                            ),
                                            (route) => false);
                                      },
                                      child: const Text("Done"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Continue"),
                                    )
                                  ],
                                );
                              });
                        } else {
                          setState(() {
                            dx = 0;
                          });
                        }
                      },
                      onHorizontalDragUpdate: (details) {
                        // print(details.localPosition.dx);
                        if (details.localPosition.dx > dx) {
                          setState(() {
                            dx = details.localPosition.dx;
                          });
                          if (dx >= 250) {}
                        }
                      },
                      child: RawMaterialButton(
                        fillColor: Colors.white,
                        onPressed: () {},
                        child: const Text("data"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
