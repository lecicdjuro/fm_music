import 'package:fm_music/data_provider/model/track.dart';

abstract class TracksState {}

class InitialState extends TracksState {}

class LoadingState extends TracksState {}

class TracksErrorState extends TracksState {}

class DisplayTracksState extends TracksState {
  DisplayTracksState({required this.tracks});

  final List<Track> tracks;
}
