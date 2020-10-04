import 'package:dart_server/src/data/entities/album.dart';
import 'package:dart_server/src/data/entities/artist.dart';
import 'package:dart_server/src/data/entities/genre.dart';
import 'package:dart_server/src/data/providers/mongo_provider.dart';

class TrackEntity implements Decodeable {
  String title;
  AlbumEntity album;
  List<ArtistEntity> artists;
  String url;
  String bpm;
  String textKey;
  GenreEntity genre;

  TrackEntity(this.title, this.album, this.artists, this.url, this.genre);

  @override
  Map<String, dynamic> decode() {
    return {
      "title": title,
      "album": album.decode(),
      "artists": artists.map((e) => e.decode()).toList(),
      "resourceLocation": {"url": url},
      "genre": genre.decode(),
      "bpm": bpm,
      "key": textKey
    };
  }
}
