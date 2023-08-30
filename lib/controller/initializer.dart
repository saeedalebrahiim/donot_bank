import 'package:donot_bank/model/db/boxes/boxes.dart';
import 'package:donot_bank/model/db/objects/cards.dart';
import 'package:donot_bank/model/db/objects/users.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

initlize() async {
  Box<UserObject> userBox = await Hive.openBox("userBox");
  if (userBox.isEmpty) {
    userBox.add(UserObject(
        userName: "Admin", phoneNumbers: "09111111111", id: Uuid().v1()));
  }
  Boxes.cardBox = await Hive.openBox("cardBox");
  if (Boxes.cardBox.isEmpty) {
    Boxes.cardBox.add(CardsObject(
        balance: "1000",
        exDate: "Dec 17",
        cardNumber: "565647473838",
        id: Uuid().v1(),
        userId: Uuid().v1()));
    Boxes.cardBox.add(CardsObject(
        balance: "10",
        exDate: "Aug 07",
        cardNumber: "565647473838",
        id: Uuid().v1(),
        userId: userBox.values.first.id));
  }
}
