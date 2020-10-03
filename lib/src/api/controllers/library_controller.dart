import 'package:dart_server/src/domain/use_cases/upload_track_use_case.dart';
import 'package:dart_server/src/foundation/result.dart';
import 'package:jaguar_reflect/jaguar_reflect.dart';
import 'package:path/path.dart' as p;
import 'dart:async';

@GenController(path: '/library')
class LibraryController implements Controller {
  UploadTrackUseCaseInterface uploadTrackUseCase =
      new UploadTrackUseCase(StorageProvider());
  Future<void> before(Context ctx) {}

  @GetJson()
  String getLibray(Context ctx) {
    return "This is just a mock for now";
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
