import 'package:fm_music/data/models/image_model.dart';
import 'package:fm_music/domain/entities/album.dart';

class AlbumModel extends Album {
  const AlbumModel(
      {required String name,
      required String artistName,
      required List<ImageModel> images})
      : super(name: name, artistName: artistName, images: images);

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
        name: json['title'] as String,
        artistName: json['artist'] as String,
        images: (json['image'] as List<dynamic>)
            .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
