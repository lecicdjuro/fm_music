import 'package:fm_music/data/models/track_model.dart';

class SearchTracksResponseModel {
  SearchTracksResponseModel({required this.tracks});

  final List<TrackModel> tracks;

  factory SearchTracksResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchTracksResponseModel(
        tracks: List<TrackModel>.from(json['results']['trackmatches']['track']
            .map((e) => TrackModel.fromJson(e as Map<String, dynamic>))));
  }
}
