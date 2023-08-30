import 'package:hive/hive.dart';
part 'transaction.g.dart';

@HiveType(typeId: 2)
class TransactionObject {
  TransactionObject({
    required this.shopId,
    required this.dateTime,
    required this.amount,
    required this.id,
    required this.isDeposite,
    required this.cardId,
  });
  @HiveField(0)
  final String shopId;
  @HiveField(1)
  final String dateTime;
  @HiveField(2)
  final String amount;
  @HiveField(3)
  final bool isDeposite;
  @HiveField(4)
  final String id;
  @HiveField(5)
  final String cardId;
}
