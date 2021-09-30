import 'package:fm_music/data_provider/model/track.dart';
import 'package:fm_music/error/base_exception.dart';

abstract class TracksState {}

class InitialState extends TracksState {}

class LoadingState extends TracksState {}

class TracksErrorState extends TracksState {
  TracksErrorState(this.exception);

  final BaseException exception;
}

class DisplayTracksState extends TracksState {
  DisplayTracksState({required this.tracks});

  final List<Track> tracks;
}
