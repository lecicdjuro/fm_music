import 'package:equatable/equatable.dart';
import 'package:fm_music/domain/entities/album.dart';
import 'package:fm_music/domain/entities/artist.dart';
import 'package:fm_music/domain/entities/wki.dart';

class TrackInfo extends Equatable {
  const TrackInfo(
      {required this.url,
      required this.listeners,
      required this.playcount,
      required this.artist,
      required this.name,
      required this.duration,
      this.wiki,
      this.album});

  final String name;
  final String url;
  final String listeners;
  final String playcount;
  final Artist artist;
  final Wiki? wiki;
  final Album? album;
  final String duration;

  @override
  List<Object?> get props =>
      [url, listeners, playcount, artist, name, duration, wiki, album];

  @override
  bool? get stringify => true;

  bool get hasAlbumInfo => album != null;
}
