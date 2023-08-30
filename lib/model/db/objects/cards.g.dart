// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardsObjectAdapter extends TypeAdapter<CardsObject> {
  @override
  final int typeId = 1;

  @override
  CardsObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardsObject(
      balance: fields[0] as String,
      exDate: fields[1] as String,
      cardNumber: fields[2] as String,
      id: fields[3] as String,
      userId: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CardsObject obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.balance)
      ..writeByte(1)
      ..write(obj.exDate)
      ..writeByte(2)
      ..write(obj.cardNumber)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardsObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
