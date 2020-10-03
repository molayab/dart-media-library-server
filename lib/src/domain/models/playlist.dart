import 'package:dart_server/src/domain/models/media.dart';
import 'package:dart_server/src/domain/models/track.dart';

class Playlist extends MediaModel {
  String title;
  List<Track> collection;
}
