import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fm_music/core/params/track_request_params.dart';
import 'package:fm_music/core/resources/data_state.dart';
import 'package:fm_music/domain/entities/track.dart';
import 'package:fm_music/domain/usecases/get_track_info_usecase.dart';
import 'package:fm_music/presentation/track_info/bloc/track_info_event.dart';
import 'package:fm_music/presentation/track_info/bloc/track_info_state.dart';

class TrackInfoBloc extends Bloc<TrackInfoEvent, TrackInfoState> {
  final GetTrackInfoUseCase _trackInfoUseCase;

  TrackInfoBloc(this._trackInfoUseCase) : super(LoadingTrackInfoState()) {
    on<GetTrackInfoEvent>((event, emit) => _getTrackInfo(event.track, emit));
  }

  void _getTrackInfo(Track track, Emitter<TrackInfoState> emit) async {
    emit(LoadingTrackInfoState());

    final dataState = await _trackInfoUseCase(
        params: TrackRequestParams(
            method: 'track.getinfo', track: track.name, artist: track.artist));

    if (dataState is DataFailed) {
      emit(TrackInfoErrorState(dataState.error!));
    } else if (dataState is DataSuccess && dataState.data != null) {
      emit(DisplayTrackInfoState(trackInfo: dataState.data!));
    }
  }
}
