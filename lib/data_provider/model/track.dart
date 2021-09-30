import 'package:collection/collection.dart';
import 'package:fm_music/data_provider/model/image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'track.g.dart';

@JsonSerializable()
class Track {
  final String name;
  @JsonKey(name: 'artist')
  final String artist;
  @JsonKey(name: 'image')
  final List<Image> images;


  String get thumbnailImage =>
      images.firstWhereOrNull((image) => image.size == 'small')?.url ?? "";

  Track({required this.name, required this.artist, required this.images});

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
