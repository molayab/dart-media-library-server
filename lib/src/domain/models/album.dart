import 'package:dart_server/src/domain/models/media.dart';
import 'package:dart_server/src/domain/models/track.dart';

class Album extends MediaModel {
  String title;
  DateTime releaseDate;
  List<Track> collection;
}
