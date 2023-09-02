import 'package:hive/hive.dart';
part 'shops.g.dart';

@HiveType(typeId: 4)
class ShopObject {
  ShopObject({required this.name, required this.imageUrl, required this.id});
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String imageUrl;
  @HiveField(3)
  final String id;
}
