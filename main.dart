import 'package:dart_server/application.dart';
import 'package:dart_server/providers/jaguar_server_provider.dart';
import 'package:mongo_dart/mongo_dart.dart';

main() async {
  final serverContext = JaguarServerContext();
  final application = Application(serverContext);
  application.exec();
}
