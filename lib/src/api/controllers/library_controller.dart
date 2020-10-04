import 'package:dart_server/src/data/entities/album.dart';
import 'package:dart_server/src/data/entities/artist.dart';
import 'package:dart_server/src/data/entities/genre.dart';
import 'package:dart_server/src/data/entities/track.dart';
import 'package:dart_server/src/data/providers/library_provider.dart';
import 'package:dart_server/src/domain/use_cases/upload_track_use_case.dart';
import 'package:dart_server/src/foundation/result.dart';
import 'package:jaguar_reflect/jaguar_reflect.dart';
import 'package:path/path.dart' as p;

@GenController(path: '/library')
class LibraryController implements Controller {
  UploadTrackUseCaseInterface uploadTrackUseCase =
      new UploadTrackUseCase(StorageProvider());
  Future<void> before(Context ctx) {}

  @GetJson()
  Future<Map<String, dynamic>> getLibray(Context ctx) async {
    // Just for testing, provider can not be used at this level.
    LibraryProvider p = LibraryProvider();
    var genre = GenreEntity("Genre");
    var artist = ArtistEntity("Artist Name");
    var album = AlbumEntity("id", "New Album Name", artist, "1960");
    var track =
        TrackEntity("Title", album, [artist], "storage_provider::id", genre);

    await p.addTrack(track);
    return await track.decode();
  }

  @GetJson(path: '/albums')
  Future<List<Map<String, dynamic>>> getAlbums(Context ctx) async {
    // Just for testing, provider can not be used at this level.
    LibraryProvider p = LibraryProvider();
    final a = await p.getAlbums();
    return a.map((e) => e.decode()).toList();
  }

  @GetJson(path: '/albums/:id')
  Future<List<Map<String, dynamic>>> getAlbumTracks(Context ctx) async {
    // Just for testing, provider can not be used at this level.
    LibraryProvider p = LibraryProvider();
    final id = ctx.pathParams.get("id");
    final a = await p.getAlbumTracksByAlbumId(id);
    return a.map((e) => e.decode()).toList();
  }

  @Post(path: "/upload")
  Future<String> upload(Context ctx) async {
    final Map<String, FormField> formData = await ctx.bodyAsFormData();
    BinaryFileFormField resource = formData['res'];
    final temporalFile =
        await resource.writeTo(p.join('/tmp', resource.filename));
    var useCaseFuture = uploadTrackUseCase.run(temporalFile);
    var controllerFuture = useCaseFuture.then((value) {
      switch (value.status) {
        case ResultStatus.success:
          return "Success on upload";
        case ResultStatus.failure:
          return "Failure on upload";
      }
    });

    return controllerFuture;
  }
}
