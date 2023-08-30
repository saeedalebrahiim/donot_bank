import 'package:hive/hive.dart';
part 'cards.g.dart';

@HiveType(typeId: 1)
class CardsObject {
  CardsObject({
    required this.balance,
    required this.exDate,
    required this.cardNumber,
    required this.id,
    required this.userId,
  });
  @HiveField(0)
  final String balance;
  @HiveField(1)
  final String exDate;
  @HiveField(2)
  final String cardNumber;
  @HiveField(3)
  final String id;
  @HiveField(4)
  final String userId;
}
