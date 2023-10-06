// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_tip.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteTipAdapter extends TypeAdapter<FavoriteTip> {
  @override
  final int typeId = 3;

  @override
  FavoriteTip read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteTip(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteTip obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteTipAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
