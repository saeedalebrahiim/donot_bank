import 'package:hive/hive.dart';

class CardsDto {
  CardsDto({
    required this.balance,
    required this.exDate,
    required this.cardNumber,
    required this.id,
    required this.userId,
  });
  final String balance;
  final String exDate;
  final String cardNumber;
  final String id;
  final String userId;
}
