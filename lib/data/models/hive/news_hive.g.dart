// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsHiveAdapter extends TypeAdapter<NewsHive> {
  @override
  final int typeId = 1;

  @override
  NewsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsHive(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.urlSite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
