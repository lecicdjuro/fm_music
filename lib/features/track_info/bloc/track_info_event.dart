import 'package:fm_music/networking/model/track.dart';

abstract class TrackInfoEvent {}

class GetTrackInfoEvent extends TrackInfoEvent {
  GetTrackInfoEvent({required this.track});

  Track track;
}

class HandleErrorEvent extends TrackInfoEvent {
  HandleErrorEvent({required this.error});

  dynamic error;
}
