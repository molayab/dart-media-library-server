import 'package:dart_server/src/data/entities/album.dart';
import 'package:dart_server/src/data/entities/track.dart';
import 'package:dart_server/src/data/providers/mongo_provider.dart';
import 'package:dart_server/src/domain/provider_interfaces/library_provider_interface.dart';
import 'package:mongo_dart/mongo_dart.dart';

class LibraryProvider extends MongoProvider
    implements LibraryProviderInterface {
  LibraryProvider() : super("cloud_library");
  final String collection = 'user_context';

  void addTrack(TrackEntity track) async {
    insert(track, collection);
  }

  Future<List<AlbumEntity>> getAlbums() async {
    await connect();

    final pipeline = AggregationPipelineBuilder()
        .addStage(Match(where.exists('album').map['\$query']))
        .addStage(Unset(['album.releaseDate']))
        .addStage(Group(
            id: DateTime.now().hashCode,
            fields: {'albums': AddToSet(Field('album'))}))
        .build();

    final result = await getContext()
        .collection(collection)
        .aggregateToStream(pipeline)
        .toList();

    final albumList = result.first['albums'] as List;
    final albums = albumList.map((e) => e as Map<String, dynamic>).toList();
    return albums.map((e) => AlbumEntity.encode(e)).toList();
  }

  Future<List<TrackEntity>> getAlbumTracksByAlbumId(String id) async {
    await connect();

    final pipeline = AggregationPipelineBuilder()
        .addStage(Match(where.exists('album').map['\$query']))
        .addStage(Match(where.eq("album.id", id).map['\$query']))
        .build();

    final result =
        await getContext().collection(collection).aggregateToStream(pipeline);

    return result.map((e) => TrackEntity.encode(e)).toList();
  }
}
