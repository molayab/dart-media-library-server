import 'package:dart_server/src/domain/models/media.dart';
import 'package:dart_server/src/domain/models/track.dart';
import 'package:dart_server/src/domain/models/album.dart';

class Artist extends MediaModel {
  String name;
  List<Album> albums;
  List<Track> releases;
}
