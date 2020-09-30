import 'package:jaguar_reflect/jaguar_reflect.dart';

@GenController(path: '/')
class RootController implements Controller {
  Future<void> before(Context ctx) {}

  @GetJson()
  List<String> getRoot(Context ctx) {
    return ["a", "b", "c"];
  }
}
