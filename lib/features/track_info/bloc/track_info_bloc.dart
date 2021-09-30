import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fm_music/data_provider/model/track.dart';
import 'package:fm_music/data_provider/model/track_details.dart';
import 'package:fm_music/data_provider/requests/fm_requests.dart';
import 'package:fm_music/error/api_exceptions.dart';
import 'package:fm_music/error/generic_exceptions.dart';
import 'package:fm_music/features/track_info/bloc/track_info_event.dart';
import 'package:fm_music/features/track_info/bloc/track_info_state.dart';

class TrackInfoBloc extends Bloc<TrackInfoEvent, TrackInfoState> {
  TrackInfoBloc() : super(LoadingTrackInfoState()) {
    on<GetTrackInfoEvent>((event, emit) => _getTrackInfo(event.track, emit));
    on<HandleErrorEvent>((event, emit) => _handleError(event.error, emit));
  }

  void _getTrackInfo(Track track, Emitter<TrackInfoState> emit) async {
    emit(LoadingTrackInfoState());
    try {
      final TrackDetails trackDetails = await FMRequests.getTrackInfo(
          artist: track.artist, trackName: track.name);
      emit(DisplayTrackInfoState(trackDetails: trackDetails));
    } catch (error) {
      add(HandleErrorEvent(error: error));
    }
  }

  void _handleError(error, Emitter<TrackInfoState> emit) {
    if (error is APIException) {
      emit(TrackInfoErrorState(error));
    } else {
      emit(TrackInfoErrorState(GenericException()));
      log(error.toString());
    }
  }
}
