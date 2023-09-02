import 'package:donot_bank/model/db/boxes/boxes.dart';
import 'package:donot_bank/model/db/objects/cards.dart';
import 'package:donot_bank/model/db/objects/shops.dart';
import 'package:donot_bank/model/db/objects/transaction.dart';
import 'package:donot_bank/model/dto/card_dto.dart';
import 'package:donot_bank/model/dto/tranaction_dto.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TranactionState extends ChangeNotifier {
  static List<TransactionDto> tranactions = [];
  getTransactions() async {
    Boxes.transactionBox = await Hive.openBox("transactionBox");
    Boxes.shopBox = await Hive.openBox("shopBox");
    Boxes.cardBox = await Hive.openBox("cardBox");
    Boxes.userBox = await Hive.openBox("userBox");
    tranactions.clear();
    String cardId = Boxes.cardBox.values.last.id;

    List<TransactionObject> dbList = Boxes.transactionBox.values
        .where((element) => element.cardId == cardId)
        .toList();
    print("dbList ${dbList.length}");

    dbList.forEach((element) {
      ShopObject shop =
          Boxes.shopBox.values.firstWhere((e) => e.id == element.shopId);
      print("shop ${shop.name}");

      tranactions.add(TransactionDto(
        amount: element.amount,
        isDeposite: element.isDeposite,
        dateTime: element.dateTime,
        id: element.id,
        cardId: element.id,
        shopImage: shop.imageUrl,
        shopName: shop.name,
      ));
    });

    notifyListeners();
  }
}
