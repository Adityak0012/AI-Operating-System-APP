// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitItemAdapter extends TypeAdapter<HabitItem> {
  @override
  final int typeId = 2;

  @override
  HabitItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HabitItem(
      name: fields[0] as String,
      progress: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HabitItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.progress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
