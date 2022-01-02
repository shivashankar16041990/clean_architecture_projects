
import 'package:hive/hive.dart';
import 'package:jake_wharton/feature/jakes/2_domain/2_entities/Post%20Entity.dart';

import 'Post model.dart';



@HiveType(typeId: 1)
class ListToStore extends HiveObject{
  @HiveField(0)
  List<Post> postlist;
  ListToStore({required this.postlist});

}
// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListToStoreAdapter extends TypeAdapter<ListToStore> {
  @override
  final int typeId = 1;

  @override
  ListToStore read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListToStore(
      postlist: (fields[0] as List).cast<Post>(),
    );
  }

  @override
  void write(BinaryWriter writer, ListToStore obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.postlist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ListToStoreAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
