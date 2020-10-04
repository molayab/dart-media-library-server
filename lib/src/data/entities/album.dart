import 'package:dart_server/src/data/entities/artist.dart';
import 'package:dart_server/src/data/providers/mongo_provider.dart';
import 'package:dart_server/src/foundation/interfaces/identificable.dart';

class AlbumEntity implements Decodeable {
  String id;
  String title;
  ArtistEntity artist;
  String releaseYear;
  AlbumEntity(this.id, this.title, this.artist, this.releaseYear);

  static AlbumEntity encode(Map<String, dynamic> ctx) {
    final id = ctx['id'] as String;
    final title = ctx['title'] as String;
    final artist = ArtistEntity.encode(ctx['artist'] as Map<String, dynamic>);
    final releaseYear = ctx['releaseYear'] as String;

    return AlbumEntity(id, title, artist, releaseYear);
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
