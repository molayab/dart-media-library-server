import 'dart:io';
import 'package:dart_server/src/domain/provider_interfaces/library_provider_interface.dart';
import 'package:dart_server/src/domain/provider_interfaces/tag_provider_interface.dart';
import 'package:dart_server/src/foundation/result.dart';

abstract class UploadTrackUseCaseInterface {
  Future<Result<void>> run(File file);
}

class UploadTrackUseCase implements UploadTrackUseCaseInterface {
  StorageProviderInterface storageProvider;
  TagProviderInterface tagProvider;
  LibraryProviderInterface libraryProvider;

  UploadTrackUseCase(
      this.storageProvider, this.tagProvider, this.libraryProvider);

  Future<Result<void>> run(File file) async {
    // get information from file.
    final track = await tagProvider.getTrackEntityFromFile(file);

    // check if track is stored, or skip it.

    // add track to library.
    libraryProvider.addTrack(track);

    // save track in the storage provider.
    await storageProvider.save(file);

    // notiy the operation result.
    return await new Result(ResultStatus.success);
  }
}

// tmp code

abstract class StorageProviderInterface {
  void save(File file);
}

class StorageProvider implements StorageProviderInterface {
  void save(File file) {
    // save the file
  }
}
