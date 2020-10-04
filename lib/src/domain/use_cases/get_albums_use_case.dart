import 'package:dart_server/src/domain/models/album.dart';
import 'package:dart_server/src/domain/models/artist.dart';
import 'package:dart_server/src/domain/provider_interfaces/library_provider_interface.dart';
import 'package:dart_server/src/foundation/result.dart';

abstract class GetAlbumsUseCaseInterface {
  Future<List<Album>> run();
}

class GetAlbumsUseCase implements GetAlbumsUseCaseInterface {
  LibraryProviderInterface libraryProvider;
  GetAlbumsUseCase(this.libraryProvider);

  Future<List<Album>> run() async {
    final albums = await libraryProvider.getAlbums();
    return albums.map((e) {
      final artist = Artist(e.artist.name);
      return Album(e.id, e.title, artist, e.releaseYear);
    }).toList();
  }
}
