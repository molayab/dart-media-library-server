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
    final track = await tagProvider.getTrackEntityFromFile(file);
    libraryProvider.addTrack(track);
    await storageProvider.save(file);
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
