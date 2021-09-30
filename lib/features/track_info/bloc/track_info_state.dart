import 'package:fm_music/data_provider/model/track_details.dart';

abstract class TrackInfoState {}

class LoadingTrackInfoState extends TrackInfoState {}

class TrackInfoErrorState extends TrackInfoState {}

class DisplayTrackInfoState extends TrackInfoState {
  DisplayTrackInfoState({required this.trackDetails});

  final TrackDetails trackDetails;
}
