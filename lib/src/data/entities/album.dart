import 'package:dart_server/src/data/entities/artist.dart';
import 'package:dart_server/src/data/providers/mongo_provider.dart';
import 'package:dart_server/src/foundation/interfaces/identificable.dart';

class AlbumEntity implements Decodeable {
  String id;
  String title;
  ArtistEntity artist;
  String releaseYear;
  AlbumEntity(this.id, this.title, this.artist, this.releaseYear);

  static List<AlbumEntity> encode(List<Map<String, dynamic>> ctx) {
    return ctx.map((e) {
      final id = e['id'] as String;
      final title = e['title'] as String;
      final artist = ArtistEntity('todo');
      final releaseYear = e['releaseYear'] as String;

      return AlbumEntity(id, title, artist, releaseYear);
    }).toList();
  }

  @override
  Map<String, dynamic> decode() {
    return {
      'id': id,
      'title': title,
      'artist': artist.decode(),
      'releaseYear': releaseYear
    };
  }
}
