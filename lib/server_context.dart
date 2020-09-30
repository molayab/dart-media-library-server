abstract class ServerContext {
  void addRouteFor(ControllerContext controller);
  Future<dynamic> serve();
}

class ControllerContext<C> {
  final C context;
  ControllerContext(this.context);
}
