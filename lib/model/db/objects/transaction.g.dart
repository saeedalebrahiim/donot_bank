// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionObjectAdapter extends TypeAdapter<TransactionObject> {
  @override
  final int typeId = 2;

  @override
  TransactionObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionObject(
      shopId: fields[0] as String,
      dateTime: fields[1] as String,
      amount: fields[2] as String,
      id: fields[4] as String,
      isDeposite: fields[3] as bool,
      cardId: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionObject obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.shopId)
      ..writeByte(1)
      ..write(obj.dateTime)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.isDeposite)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.cardId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
