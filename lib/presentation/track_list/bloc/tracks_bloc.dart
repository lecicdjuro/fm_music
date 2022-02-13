import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fm_music/core/params/track_request_params.dart';
import 'package:fm_music/core/resources/data_state.dart';
import 'package:fm_music/domain/usecases/search_tracks_usecase.dart';
import 'package:fm_music/presentation/track_list/bloc/tracks_event.dart';
import 'package:fm_music/presentation/track_list/bloc/tracks_state.dart';

class TracksBloc extends Bloc<TracksEvent, TracksState> {
  final SearchTracksUseCase _searchTracksUseCase;

  TracksBloc(this._searchTracksUseCase) : super(InitialState()) {
    on<SearchEvent>((event, emit) => _performSearch(event.searchValue, emit),
        transformer: restartable());
  }

  void _performSearch(String searchValue, Emitter<TracksState> emit) async {
    if (searchValue.isEmpty) {
      emit(InitialState());
    } else {
      emit(const LoadingState());
      final dataState = await _searchTracksUseCase(
          params:
              TrackRequestParams(method: 'track.search', track: searchValue));

      if (dataState is DataFailed) {
        emit(TracksErrorState(dataState.error!));
      } else if (dataState is DataSuccess && dataState.data != null) {
        emit(DisplayTracksState(tracks: dataState.data!));
      }
    }
  }
}
