import 'package:fm_music/networking/model/track_details.dart';

abstract class TrackInfoState {}

class LoadingTrackInfoState extends TrackInfoState {}

class TrackInfoErrorState extends TrackInfoState {}

class DisplayTrackInfoState extends TrackInfoState {
  DisplayTrackInfoState({required this.trackDetails});

  final TrackDetails trackDetails;
}
