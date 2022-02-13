import "package:dio/dio.dart";
import 'package:equatable/equatable.dart';
import 'package:fm_music/domain/entities/track.dart';
import 'package:fm_music/domain/entities/track_info.dart';

abstract class TrackInfoState extends Equatable {
  const TrackInfoState({this.track, this.trackInfo, this.error});

  final Track? track;
  final TrackInfo? trackInfo;
  final DioError? error;

  @override
  List<Object?> get props => [track, error];
}

class LoadingTrackInfoState extends TrackInfoState {}

class TrackInfoErrorState extends TrackInfoState {
  const TrackInfoErrorState(DioError dioError) : super(error: dioError);
}

class DisplayTrackInfoState extends TrackInfoState {
  const DisplayTrackInfoState({required TrackInfo trackInfo})
      : super(trackInfo: trackInfo);
}
