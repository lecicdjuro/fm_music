import 'package:fm_music/domain/entities/artist.dart';

class ArtistModel extends Artist {
  const ArtistModel({required String name, required String url})
      : super(name: name, url: url);

  factory ArtistModel.fromJson(Map<String, dynamic> json) {
    return ArtistModel(
        name: json['name'] as String, url: json['url'] as String);
  }
}
