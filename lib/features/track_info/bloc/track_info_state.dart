import 'package:fm_music/data_provider/model/track_details.dart';
import 'package:fm_music/error/base_exception.dart';

abstract class TrackInfoState {}

class LoadingTrackInfoState extends TrackInfoState {}

class TrackInfoErrorState extends TrackInfoState {
  TrackInfoErrorState(this.exception);

  final BaseException exception;
}

class DisplayTrackInfoState extends TrackInfoState {
  DisplayTrackInfoState({required this.trackDetails});

  final TrackDetails trackDetails;
}
