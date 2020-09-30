import 'package:dart_server/server_context.dart';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar/serve/server.dart';
import 'package:jaguar_reflect/jaguar_reflect.dart';

class JaguarServerContext implements ServerContext {
  final _server = Jaguar();

  void addRouteFor(ControllerContext controller) {
    _server.add(reflect(controller.context));
  }

  Future<dynamic> serve() {
    return _server.serve();
  }
}
