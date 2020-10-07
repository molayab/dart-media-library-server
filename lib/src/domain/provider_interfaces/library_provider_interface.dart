import 'package:dart_server/src/data/entities/track.dart';

abstract class LibraryProviderInterface {
  void addTrack(TrackEntity track);
  Future<List<void>> getAlbums();
  Future<List<TrackEntity>> getAlbumTracksByAlbumId(String id);
}
