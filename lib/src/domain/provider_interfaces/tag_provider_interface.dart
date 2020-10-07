import 'dart:io';
import 'package:dart_server/src/data/entities/track.dart';

abstract class TagProviderInterface {
  Future<TrackEntity> getTrackEntityFromFile(File file);
}
