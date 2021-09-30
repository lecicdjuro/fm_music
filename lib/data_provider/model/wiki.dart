
import 'package:json_annotation/json_annotation.dart';

part 'wiki.g.dart';

@JsonSerializable()
class Wiki {
  Wiki({required this.published});

  factory Wiki.fromJson(Map<String, dynamic> json) => _$WikiFromJson(json);

  Map<String, dynamic> toJson() => _$WikiToJson(this);

  @JsonKey(name: 'published')
  String published;
}
