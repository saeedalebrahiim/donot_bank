import 'package:donot_bank/model/db/boxes/boxes.dart';
import 'package:donot_bank/model/db/objects/cards.dart';
import 'package:donot_bank/model/dto/card_dto.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CardState extends ChangeNotifier {
  static CardsDto? card;
  getCard() async {
    Boxes.userBox = await Hive.openBox("userBox");
    Boxes.cardBox = await Hive.openBox("cardBox");
    String userId = Boxes.userBox.values.first.id;
    CardsObject theFirst = Boxes.cardBox.values.first;
    CardsDto dto = CardsDto(
        balance: theFirst.balance,
        exDate: theFirst.exDate,
        cardNumber: theFirst.cardNumber,
        id: theFirst.id,
        userId: theFirst.userId);
    card = dto;
    notifyListeners();
  }
}
