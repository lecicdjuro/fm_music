import 'package:fm_music/networking/model/track.dart';

abstract class TrackInfoEvent {}

class GetTrackInfo extends TrackInfoEvent {
  GetTrackInfo({required this.track});

  Track track;
}
