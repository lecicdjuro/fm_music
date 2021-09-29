import 'package:fm_music/networking/model/image.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
part 'track.g.dart';

@JsonSerializable()
class Track {
  final String name;
  @JsonKey(name: 'artist')
  final String artist;
  @JsonKey(name: 'image')
  final List<Image> images;

  String get coverImage => images.firstWhereOrNull((image) => image.size == 'medium')?.url ?? "";

  Track({required this.name, required this.artist, required this.images});

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
