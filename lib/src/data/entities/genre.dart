import 'package:dart_server/src/data/providers/mongo_provider.dart';

class GenreEntity implements Decodeable {
  String name;
  GenreEntity(this.name);

  @override
  Map<String, dynamic> decode() {
    return {'name': name};
  }
}
