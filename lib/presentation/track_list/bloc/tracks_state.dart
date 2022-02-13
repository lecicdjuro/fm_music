import "package:dio/dio.dart";
import 'package:equatable/equatable.dart';
import 'package:fm_music/domain/entities/track.dart';

abstract class TracksState extends Equatable {
  const TracksState({this.tracks, this.error});

  final List<Track>? tracks;
  final DioError? error;

  @override
  List<Object?> get props => [tracks, error];

  bool get hasTracks => tracks != null && tracks!.isNotEmpty;
}

class InitialState extends TracksState {}

class LoadingState extends TracksState {
  const LoadingState();
}

class TracksErrorState extends TracksState {
  const TracksErrorState(DioError dioError) : super(error: dioError);
}

class DisplayTracksState extends TracksState {
  const DisplayTracksState({required List<Track> tracks})
      : super(tracks: tracks);
}
