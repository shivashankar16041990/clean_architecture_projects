import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Post extends HiveObject with EquatableMixin {
  Post({required this.description, required this.language, required this.name, required this.open_issues, required this.watchers});
  @HiveField(0)
  String name;
  @HiveField(1)
  int open_issues;
  @HiveField(2)
  int watchers;
  @HiveField(3)
  String language;
  @HiveField(4)
  String description;

  @override
  List<Object> get props => [name,open_issues,watchers,language,description];
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 0;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post(
      description: fields[4] as String,
      language: fields[3] as String,
      name: fields[0] as String,
      open_issues: fields[1] as int,
      watchers: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.open_issues)
      ..writeByte(2)
      ..write(obj.watchers)
      ..writeByte(3)
      ..write(obj.language)
      ..writeByte(4)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PostAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
