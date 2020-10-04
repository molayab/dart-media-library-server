import 'dart:io';
import 'package:dart_server/src/data/entities/album.dart';
import 'package:dart_server/src/data/entities/artist.dart';
import 'package:dart_server/src/data/entities/genre.dart';
import 'package:dart_server/src/data/entities/track.dart';
import 'package:dart_tags/dart_tags.dart';

class TagProvider {
  TagProcessor _tagProcessor;

  TagProvider() {
    _tagProcessor = TagProcessor();
  }

  Future<List<Tag>> getTagsFromFile(String fileName) async {
    var file = File(fileName);
    return await _tagProcessor.getTagsFromByteArray(file.readAsBytes());
  }

  Future<List<TrackEntity>> getTrackEntityFromFile(File file) async {
    var a = await getTagsFromFile(file.path);
    return a.map((e) {
      final artist = ArtistEntity(e.tags['artist']);
      final album = AlbumEntity(null, e.tags['album'], artist, 'mock');
      return TrackEntity(
          e.tags['title'], album, [artist], "storage::id", GenreEntity("mock"));
    });
  }
}
