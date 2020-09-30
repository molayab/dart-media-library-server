import 'package:dart_server/src/api/controllers/library/songs_controller.dart';
import 'package:dart_server/src/api/controllers/root_controller.dart';
import 'package:dart_server/src/api/controllers/library_controller.dart';

class Application {
  final ServerContext _server;

  Application(this._server);

  void exec() async {
    configureAvailableControllers();
    await _server.serve();
  }

  void configureAvailableControllers() {
    _server.addRouteFor(ControllerContext(new RootController()));
    _server.addRouteFor(ControllerContext(new LibraryController()));
    _server.addRouteFor(ControllerContext(new SongsController()));
  }
}

abstract class ServerContext {
  void addRouteFor(ControllerContext controller);
  Future<dynamic> serve();
}

class ControllerContext<C> {
  final C context;
  ControllerContext(this.context);
}
