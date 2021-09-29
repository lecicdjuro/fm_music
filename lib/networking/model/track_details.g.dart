// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackDetails _$TrackDetailsFromJson(Map<String, dynamic> json) => TrackDetails(
      id: json['id'] as int,
      url: json['url'] as String,
      listeners: json['listeners'] as String,
      playcount: json['playcount'] as String,
      artist: Artist.fromJson(json['artist'] as Map<String, dynamic>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$TrackDetailsToJson(TrackDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'listeners': instance.listeners,
      'playcount': instance.playcount,
      'artist': instance.artist,
    };
