import 'package:dart_server/src/domain/models/artist.dart';

class Album {
  String id;
  String title;
  Artist artist;
  String releaseYear;
  Album(this.id, this.title, this.artist, this.releaseYear);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': {'name': artist.name},
      'releaseYear': releaseYear
    };
  }
}
