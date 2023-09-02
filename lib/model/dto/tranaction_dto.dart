class TransactionDto {
  TransactionDto({
    required this.shopName,
    required this.shopImage,
    required this.dateTime,
    required this.amount,
    required this.id,
    required this.isDeposite,
    required this.cardId,
  });
  final String shopName;
  final String shopImage;

  final String dateTime;
  final String amount;
  final bool isDeposite;
  final String id;
  final String cardId;
}
