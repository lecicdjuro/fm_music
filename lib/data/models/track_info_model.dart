import 'package:fm_music/data/models/album_model.dart';
import 'package:fm_music/data/models/artist_model.dart';
import 'package:fm_music/data/models/wiki_model.dart';
import 'package:fm_music/domain/entities/track_info.dart';

class TrackInfoModel extends TrackInfo {
  const TrackInfoModel(
      {required String url,
      required String listeners,
      required String playcount,
      required ArtistModel artist,
      required String name,
      required String duration,
      WikiModel? wiki,
      AlbumModel? album})
      : super(
            url: url,
            listeners: listeners,
            playcount: playcount,
            artist: artist,
            name: name,
            duration: duration,
            wiki: wiki,
            album: album);

  factory TrackInfoModel.fromJson(Map<String, dynamic> json) {
    return TrackInfoModel(
      url: json['url'] as String,
      listeners: json['listeners'] as String,
      playcount: json['playcount'] as String,
      artist: ArtistModel.fromJson(json['artist'] as Map<String, dynamic>),
      name: json['name'] as String,
      duration: json['duration'] as String,
      wiki: json['wiki'] == null
          ? null
          : WikiModel.fromJson(json['wiki'] as Map<String, dynamic>),
      album: json['album'] == null
          ? null
          : AlbumModel.fromJson(json['album'] as Map<String, dynamic>),
    );
  }
}
