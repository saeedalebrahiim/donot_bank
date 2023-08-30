import 'package:hive/hive.dart';
part 'users.g.dart';

@HiveType(typeId: 0)
class UserObject {
  UserObject(
      {required this.userName, required this.phoneNumbers, required this.id});
  @HiveField(0)
  final String userName;
  @HiveField(1)
  final String phoneNumbers;
  @HiveField(3)
  final String id;
}
