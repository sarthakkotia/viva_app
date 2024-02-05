// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventModelwithHive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventModelAdapter extends TypeAdapter<EventModel> {
  @override
  final int typeId = 0;

  @override
  EventModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventModel(
      Title: fields[0] as String,
      DateandTime: fields[4] as DateTime,
      Day: fields[6] as int,
      Desc: fields[1] as String,
      Genre: fields[3] as String,
      Img: fields[2] as String,
      Venue: fields[5] as String,
      Poster: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EventModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.Title)
      ..writeByte(1)
      ..write(obj.Desc)
      ..writeByte(2)
      ..write(obj.Img)
      ..writeByte(3)
      ..write(obj.Genre)
      ..writeByte(4)
      ..write(obj.DateandTime)
      ..writeByte(5)
      ..write(obj.Venue)
      ..writeByte(6)
      ..write(obj.Day)
      ..writeByte(7)
      ..write(obj.Poster);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
