import 'package:fm_music/data/models/image_model.dart';
import 'package:fm_music/domain/entities/track.dart';

class TrackModel extends Track {
  const TrackModel(
      {int? id,
      required String name,
      required String artist,
      required List<ImageModel> images})
      : super(id, name, artist, images);

  factory TrackModel.fromJson(Map<String, dynamic> json) {
    return TrackModel(
        name: json['name'] as String,
        artist: json['artist'] as String,
        images: (json['image'] as List<dynamic>)
            .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
