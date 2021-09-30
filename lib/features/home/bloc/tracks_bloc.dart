import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fm_music/features/home/bloc/tracks_event.dart';
import 'package:fm_music/features/home/bloc/tracks_state.dart';
import 'package:fm_music/networking/model/track.dart';
import 'package:fm_music/networking/requests/fm_requests.dart';

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

  // @override
  // Stream<Transition<TracksEvent, TracksState>> transformEvents(
  //     Stream<TracksEvent> events, transitionFn) {
  //   // debounce calling search API events
  //   // return events.delayWhen((event) => event is SearchEvent)
  //   //     .debounceTime(const Duration(milliseconds: 300))
  //   //     .switchMap((transitionFn));
  //   //
  //   // return events.delayWhen((event) => Rx.timer(null, Duration(seconds: i)))
  //
  //   return events
  //       .delayWhen(
  //         (event) => isStreamEvent(event),
  //         listenDelay: Rx.timer(null, const Duration(milliseconds: 2000)),
  //       )
  //       .switchMap((transitionFn));
  // }
  //
  // Stream<bool> isStreamEvent(TracksEvent event) async* {
  //   yield event is SearchEvent;
  // }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(HandleErrorEvent(error: error));
    super.onError(error, stackTrace);
  }

  void _handleError(error, Emitter<TracksState> emit) {
    emit(TracksErrorState());
  }
}
