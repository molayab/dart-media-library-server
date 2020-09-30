import 'package:dart_server/server_context.dart';
import 'package:dart_server/src/api/controllers/root_controller.dart';

class Application {
  final ServerContext _server;

  Application(this._server);

  void exec() async {
    configureAvailableControllers();
    await _server.serve();
  }

  void configureAvailableControllers() {
    _server.addRouteFor(ControllerContext(new RootController()));
  }
}
