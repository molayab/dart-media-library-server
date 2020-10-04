import 'package:mongo_dart/mongo_dart.dart';

abstract class DatabaseInterface {
  void connect();
  void insert(Decodeable model, String collection);
}

class MongoProvider implements DatabaseInterface {
  String _database;
  String _uri;
  Db _dbContext;

  MongoProvider(String database,
      [String connectionContext =
          'mongodb://application:application@mongo:27017/']) {
    _uri = connectionContext;
    _database = database;
  }

  destroy() {
    close();
  }

  void connect() async {
    if (_dbContext != null && _dbContext.isConnected) {
      return;
    }

    final uri = _uri + _database;
    _dbContext = Db(uri);
    await _dbContext.open();
  }

  void close() async {
    if (_dbContext != null && _dbContext.isConnected) {
      await _dbContext.close();
    }
  }

  void insert(Decodeable model, String collection) async {
    await connect();
    await _dbContext.collection(collection).insert(model.decode());
  }

  Db getContext() {
    return _dbContext;
  }
}

abstract class Decodeable {
  Map<String, dynamic> decode();
}
