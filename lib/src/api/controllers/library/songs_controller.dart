import 'package:jaguar_reflect/jaguar_reflect.dart';

@GenController(path: '/library/songs')
class SongsController implements Controller {
  Future<void> before(Context ctx) {}

  @GetJson(path: "/all")
  List<String> getAll(Context ctx) {
    return ["Song 1", "Song 2", "Song n"];
  }

  @GetJson(path: "/:id")
  String getSong(Context ctx) {
    var id = ctx.pathParams.get("id");
    return "Requested id was ${id}";
  }
}
