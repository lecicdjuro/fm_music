import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fm_music/features/tracks/bloc/tracks_event.dart';
import 'package:fm_music/features/tracks/bloc/tracks_state.dart';
import 'package:fm_music/data_provider/model/track.dart';
import 'package:fm_music/data_provider/requests/fm_requests.dart';

class TracksBloc extends Bloc<TracksEvent, TracksState> {
  TracksBloc() : super(InitialState()) {
    on<SearchEvent>((event, emit) => _performSearch(event.searchValue, emit));
    on<HandleErrorEvent>((event, emit) => _handleError(event.error, emit));
  }

  void _performSearch(String searchValue, Emitter<TracksState> emit) async {
    if (searchValue.isEmpty) {
      emit(InitialState());
    } else {
      emit(LoadingState());
      List<Track> tracks =
          await FMRequests.performTrackSearch(searchTerm: searchValue);
      emit(DisplayTracksState(tracks: tracks));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(HandleErrorEvent(error: error));
    super.onError(error, stackTrace);
  }

  void _handleError(error, Emitter<TracksState> emit) {
    emit(TracksErrorState());
  }
}
