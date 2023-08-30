// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shops.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class shopObjectAdapter extends TypeAdapter<shopObject> {
  @override
  final int typeId = 4;

  @override
  shopObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return shopObject(
      name: fields[0] as String,
      imageUrl: fields[1] as String,
      id: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, shopObject obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is shopObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
