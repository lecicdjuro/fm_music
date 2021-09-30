import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fm_music/features/track_info/bloc/track_info_event.dart';
import 'package:fm_music/features/track_info/bloc/track_info_state.dart';
import 'package:fm_music/networking/model/track.dart';
import 'package:fm_music/networking/model/track_details.dart';
import 'package:fm_music/networking/requests/fm_requests.dart';

class TrackInfoBloc extends Bloc<TrackInfoEvent, TrackInfoState> {
  TrackInfoBloc() : super(LoadingTrackInfoState()) {
    on<GetTrackInfoEvent>((event, emit) => _getTrackInfo(event.track, emit));
    on<HandleErrorEvent>((event, emit) => _handleError(event.error, emit));
  }

  void _getTrackInfo(Track track, Emitter<TrackInfoState> emit) async {
    emit(LoadingTrackInfoState());
    final TrackDetails trackDetails = await FMRequests.getTrackInfo(
        artist: track.artist, trackName: track.name);
    emit(DisplayTrackInfoState(trackDetails: trackDetails));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(HandleErrorEvent(error: error));
    super.onError(error, stackTrace);
  }

  void _handleError(error, Emitter<TrackInfoState> emit) {
    emit(TrackInfoErrorState());
  }
}
