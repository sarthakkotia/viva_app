// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventsList.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventsListAdapter extends TypeAdapter<EventsList> {
  @override
  final int typeId = 6;

  @override
  EventsList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventsList(
      ls: (fields[0] as List).cast<EventModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, EventsList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.ls);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventsListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
