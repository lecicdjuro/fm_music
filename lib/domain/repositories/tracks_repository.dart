import 'package:fm_music/core/params/track_request_params.dart';
import 'package:fm_music/core/resources/data_state.dart';
import 'package:fm_music/domain/entities/track.dart';
import 'package:fm_music/domain/entities/track_info.dart';

abstract class TracksRepository {
  Future<DataState<List<Track>>> searchForTracks(TrackRequestParams params);

  Future<DataState<TrackInfo>> getTrackInfo(TrackRequestParams params);
}
