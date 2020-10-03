import 'package:dart_server/src/domain/models/media.dart';
import 'package:dart_server/src/domain/models/album.dart';
import 'package:dart_server/src/domain/models/artist.dart';

class Track extends MediaModel {
  String title;
  Album album;
  List<Artist> artists;
}
