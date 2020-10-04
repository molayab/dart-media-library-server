import 'package:dart_server/src/data/providers/mongo_provider.dart';

class ArtistEntity implements Decodeable {
  String name;
  ArtistEntity(this.name);

  static ArtistEntity encode(Map<String, dynamic> ctx) {
    final name = ctx['name'] as String;
    return ArtistEntity(name);
  }

  @override
  Map<String, dynamic> decode() {
    return {'name': name};
  }
}
