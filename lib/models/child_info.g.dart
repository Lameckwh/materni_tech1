// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChildInfoAdapter extends TypeAdapter<ChildInfo> {
  @override
  final int typeId = 2;

  @override
  ChildInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChildInfo(
      days: fields[0] as int,
      months: fields[1] as int,
      years: fields[2] as int,
      dateOfBirth: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ChildInfo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.days)
      ..writeByte(1)
      ..write(obj.months)
      ..writeByte(2)
      ..write(obj.years)
      ..writeByte(3)
      ..write(obj.dateOfBirth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChildInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
