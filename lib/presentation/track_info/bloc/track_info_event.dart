import 'package:equatable/equatable.dart';
import 'package:fm_music/domain/entities/track.dart';

abstract class TrackInfoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetTrackInfoEvent extends TrackInfoEvent {
  GetTrackInfoEvent({required this.track});

  final Track track;
}
