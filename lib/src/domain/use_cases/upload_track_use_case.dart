import 'dart:io';
import 'package:dart_server/src/foundation/result.dart';

abstract class UploadTrackUseCaseInterface {
  Future<Result<void>> run(File file);
}

class UploadTrackUseCase implements UploadTrackUseCaseInterface {
  StorageProviderInterface storageProvider;
  UploadTrackUseCase(this.storageProvider);

  Future<Result<void>> run(File file) async {
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
