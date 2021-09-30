import 'package:collection/collection.dart';
import 'package:fm_music/networking/model/image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  @JsonKey(name: 'title')
  final String name;
  @JsonKey(name: 'artist')
  final String artistName;
  @JsonKey(name: 'image')
  final List<Image> images;

//assume that all albums have medium images
  String get coverImage =>
      images.firstWhereOrNull((image) => image.size == 'medium')?.url ?? "";

  Album({required this.name, required this.artistName, required this.images});

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
