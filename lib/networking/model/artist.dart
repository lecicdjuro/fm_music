import 'package:json_annotation/json_annotation.dart';

part 'artist.g.dart';

@JsonSerializable()
class Artist {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'url')
  final String url;

  Artist({required this.name, required this.url});

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistToJson(this);
}
