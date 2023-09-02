import 'package:donot_bank/model/db/objects/cards.dart';
import 'package:donot_bank/model/db/objects/shops.dart';
import 'package:donot_bank/model/db/objects/transaction.dart';
import 'package:donot_bank/model/db/objects/users.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes {
  static late Box<UserObject> userBox;
  static late Box<CardsObject> cardBox;
  static late Box<TransactionObject> transactionBox;
  static late Box<ShopObject> shopBox;
}
