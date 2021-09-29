import 'package:fm_music/networking/model/artist.dart';
import 'package:json_annotation/json_annotation.dart';

part 'track_details.g.dart';

@JsonSerializable()
class TrackDetails {
  final int id;
  final String name;
  final String url;
  final String listeners;
  final String playcount;
  final Artist artist;

  TrackDetails({
    required this.id,
    required this.url,
    required this.listeners,
    required this.playcount,
    required this.artist,
    required this.name,
  });

  factory TrackDetails.fromJson(Map<String, dynamic> json) =>
      _$TrackDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TrackDetailsToJson(this);
}
