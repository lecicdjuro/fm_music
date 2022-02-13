import 'package:fm_music/data/models/track_info_model.dart';

class TrackInfoResponseModel {
  TrackInfoResponseModel({required this.trackInfo});

  final TrackInfoModel trackInfo;

  factory TrackInfoResponseModel.fromJson(Map<String, dynamic> json) {
    return TrackInfoResponseModel(
        trackInfo: TrackInfoModel.fromJson(json['track']));
  }
}
