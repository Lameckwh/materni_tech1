// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pregnancy_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PregnancyInfoAdapter extends TypeAdapter<PregnancyInfo> {
  @override
  final int typeId = 1;

  @override
  PregnancyInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PregnancyInfo(
      days: fields[0] as String,
      weeks: fields[1] as int,
      deliveryDate: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PregnancyInfo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.days)
      ..writeByte(1)
      ..write(obj.weeks)
      ..writeByte(2)
      ..write(obj.deliveryDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PregnancyInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
