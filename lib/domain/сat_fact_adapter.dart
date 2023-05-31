import 'package:hive/hive.dart';

import '../models/cat_fact.dart';

class CatFactAdapter extends TypeAdapter<CatFact> {
  @override
  int get typeId => 0; // Unique identifier for this adapter

  @override
  CatFact read(BinaryReader reader) {
    final text = reader.read();
    final createdAt = reader.read();
    return CatFact(
      fact: text,
      length:createdAt,
    );
  }

  @override
  void write(BinaryWriter writer, CatFact obj) {
    writer.write(obj.fact);
    writer.write(obj.length);
  }
}