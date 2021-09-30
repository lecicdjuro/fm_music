import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fm_music/features/home/bloc/tracks_event.dart';
import 'package:fm_music/features/home/bloc/tracks_state.dart';
import 'package:fm_music/networking/model/track.dart';
import 'package:fm_music/networking/requests/fm_requests.dart';
import 'package:rxdart/rxdart.dart';

class TracksBloc extends Bloc<TracksEvent, TracksState> {
  TracksBloc() : super(InitialState()) {
    on<SearchEvent>((event, emit) => _performSearch(event.searchValue, emit));
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
  Stream<Transition<TracksEvent, TracksState>> transformEvents(
      Stream<TracksEvent> events, transitionFn) {
    //debounce calling search API events
    return events
        .debounceTime(const Duration(milliseconds: 500))
        .switchMap((transitionFn));
  }
}
