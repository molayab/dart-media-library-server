import 'package:dart_server/src/data/providers/mongo_provider.dart';

class ArtistEntity implements Decodeable {
  String name;
  ArtistEntity(this.name);

  @override
  Map<String, dynamic> decode() {
    return {'name': name};
  }
}
