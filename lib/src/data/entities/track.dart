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

  static TrackEntity encode(Map<String, dynamic> ctx) {
    final artiststList = ctx['artists'] as List;
    final artists = artiststList.map((e) => e as Map<String, dynamic>).map((e) {
      final name = e['name'] as String;
      return ArtistEntity(name);
    }).toList();

    final title = ctx['title'] as String;
    final album = AlbumEntity.encode(ctx['album'] as Map<String, dynamic>);
    final resourceLocation = ctx['resourceLocation'] as Map<String, dynamic>;
    final url = resourceLocation['url'] as String;
    return TrackEntity(title, album, artists, url, GenreEntity("genre"));
  }

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
