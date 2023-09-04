import 'package:donot_bank/model/db/boxes/boxes.dart';
import 'package:donot_bank/model/db/objects/cards.dart';
import 'package:donot_bank/model/db/objects/shops.dart';
import 'package:donot_bank/model/db/objects/transaction.dart';
import 'package:donot_bank/model/db/objects/users.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

initlize() async {
  Box<UserObject> userBox = await Hive.openBox("userBox");
  if (userBox.isEmpty) {
    userBox.add(UserObject(
        userName: "Admin", phoneNumbers: "09111111111", id: const Uuid().v1()));
  }
  Boxes.cardBox = await Hive.openBox("cardBox");
  if (Boxes.cardBox.isEmpty) {
    Boxes.cardBox.add(CardsObject(
        balance: "1000",
        exDate: "Dec 17",
        cardNumber: "565647473838",
        id: const Uuid().v1(),
        userId: const Uuid().v1()));
    Boxes.cardBox.add(CardsObject(
        balance: "10",
        exDate: "Aug 07",
        cardNumber: "565647473838",
        id: const Uuid().v1(),
        userId: userBox.values.first.id));
  }
  Boxes.shopBox = await Hive.openBox("shopBox");
  if (Boxes.shopBox.isEmpty) {
    Boxes.shopBox.add(ShopObject(
      id: const Uuid().v1(),
      name: "Flutter",
      imageUrl: "lib/assets/favicon.png",
    ));
  }
  Boxes.transactionBox = await Hive.openBox("transactionBox");
  if (Boxes.transactionBox.isEmpty) {
    Boxes.transactionBox.add(TransactionObject(
      id: const Uuid().v1(),
      amount: "20\$",
      dateTime: DateTime.now().toString(),
      isDeposite: false,
      shopId: Boxes.shopBox.values.first.id,
      cardId: Boxes.cardBox.values.last.id,
    ));
    Boxes.transactionBox.add(TransactionObject(
      id: const Uuid().v1(),
      amount: "30\$",
      dateTime: DateTime.now().toString(),
      isDeposite: true,
      shopId: Boxes.shopBox.values.first.id,
      cardId: Boxes.cardBox.values.last.id,
    ));
  }
}
