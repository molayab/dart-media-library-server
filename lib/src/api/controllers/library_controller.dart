import 'package:dart_server/src/data/providers/library_provider.dart';
import 'package:dart_server/src/data/providers/tag_provider.dart';
import 'package:dart_server/src/domain/models/album.dart';
import 'package:dart_server/src/domain/use_cases/get_albums_use_case.dart';
import 'package:dart_server/src/domain/use_cases/upload_track_use_case.dart';
import 'package:dart_server/src/foundation/result.dart';
import 'package:jaguar_reflect/jaguar_reflect.dart';
import 'package:path/path.dart' as p;

@GenController(path: '/library')
class LibraryController implements Controller {
  UploadTrackUseCaseInterface uploadTrackUseCase = new UploadTrackUseCase(
      StorageProvider(), TagProvider(), LibraryProvider());
  Future<void> before(Context ctx) {}

  @GetJson()
  Future<Map<String, dynamic>> getLibray(Context ctx) async {
    return {};
  }

  @GetJson(path: '/albums')
  Future<List<Album>> getAlbums(Context ctx) async {
    // Just for testing, provider can not be used at this level.
    final p = GetAlbumsUseCase(LibraryProvider());
    return await p.run();
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

    // ignore: missing_return
    return useCaseFuture.then((value) {
      switch (value.status) {
        case ResultStatus.success:
          return "Success on upload";
        case ResultStatus.failure:
          return "Failure on upload";
      }
    });
  }
}
