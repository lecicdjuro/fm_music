import 'package:fm_music/networking/model/artist.dart';
import 'package:fm_music/networking/model/wiki.dart';
import 'package:fm_music/networking/model/album.dart';
import 'package:json_annotation/json_annotation.dart';

part 'track_details.g.dart';

@JsonSerializable()
class TrackDetails {
  final String name;
  final String url;
  final String listeners;
  final String playcount;
  final Artist artist;
  final Wiki wiki;
  final Album album;

  TrackDetails({
    required this.url,
    required this.wiki,
    required this.album,
    required this.listeners,
    required this.playcount,
    required this.artist,
    required this.name,
  });

  factory TrackDetails.fromJson(Map<String, dynamic> json) =>
      _$TrackDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TrackDetailsToJson(this);
}
