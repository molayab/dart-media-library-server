import 'package:dart_server/src/data/providers/mongo_provider.dart';

class TrackEntity implements Decodeable {
  String title;
  String album;
  String albumArtist;
  String artist;
  String originalArtist;
  int year;
  String genre;
  int track;
  double bpm;
  String key;
  String label;
  String contentGroupDescription;
  String description;
  String resourceLocationId;

  TrackEntity(this.title, this.resourceLocationId);

  static TrackEntity encode(Map<String, dynamic> ctx) {
    final title = ctx['title'] as String;
    final resourceUri = ctx['resourceLocationId'] as String;

    var track = TrackEntity(title, resourceUri);
    track.title = ctx['title'] as String;
    track.album = ctx['album'] as String;
    track.artist = ctx['artist'] as String;
    track.genre = ctx['genre'] as String;
    track.bpm = ctx['bpm'] as double;
    track.key = ctx['key'] as String;
    track.albumArtist = ctx['albumArtist'] as String;
    track.originalArtist = ctx['originalArtist'] as String;
    track.year = ctx['year'] as int;
    track.track = ctx['track'] as int;
    track.label = ctx['label'] as String;
    track.contentGroupDescription = ctx['contentGroupDescription'] as String;
    track.description = ctx['description'] as String;

    return track;
  }

  @override
  Map<String, dynamic> decode() {
    return {
      "title": title,
      "album": album,
      "artist": artist,
      "resourceLocationId": resourceLocationId,
      "genre": genre,
      "bpm": bpm,
      "key": key,
      "albumArtist": albumArtist,
      "originalArtist": originalArtist,
      "year": year,
      "track": track,
      "label": label,
      "contentGroupDescription": contentGroupDescription,
      "description": description
    };
  }
}
