// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserObjectAdapter extends TypeAdapter<UserObject> {
  @override
  final int typeId = 0;

  @override
  UserObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserObject(
      userName: fields[0] as String,
      phoneNumbers: fields[1] as String,
      id: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserObject obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.phoneNumbers)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
