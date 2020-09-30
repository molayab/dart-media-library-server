import 'package:jaguar_reflect/jaguar_reflect.dart';

@GenController(path: '/library')
class LibraryController implements Controller {
  Future<void> before(Context ctx) {}

  @GetJson()
  String getLibray(Context ctx) {
    return "This is just a mock for now";
  }
}
