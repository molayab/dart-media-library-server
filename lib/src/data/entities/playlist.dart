import 'package:dart_server/src/data/entities/track.dart';
import 'package:dart_server/src/data/providers/mongo_provider.dart';

class PlaylistEntity implements Decodeable {
  String title;
  List<TrackEntity> collection;

  @override
  Map<String, dynamic> decode() {
    return {'title': title, 'collection': collection.map((e) => e.decode())};
  }
}
