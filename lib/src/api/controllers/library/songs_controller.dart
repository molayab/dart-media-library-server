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

  @PutJson(path: "/:id/toggleLike")
  Object toggleLikeSong(Context ctx) {
    var id = ctx.pathParams.get("id");
    return {"isLiked": true, "message": "Liked song with id: ${id}"};
  }

  @PutJson(path: "/:id/toggleDislike")
  Object toggleDislikeSong(Context ctx) {
    var id = ctx.pathParams.get("id");

    return {"isDisliked": false, "message": "Disliked song with id: ${id}"};
  }
}
