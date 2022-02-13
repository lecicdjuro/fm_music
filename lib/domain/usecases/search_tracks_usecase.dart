import 'package:fm_music/core/params/track_request_params.dart';
import 'package:fm_music/core/resources/data_state.dart';
import 'package:fm_music/core/usecases/use_case.dart';
import 'package:fm_music/domain/entities/track.dart';
import 'package:fm_music/domain/repositories/tracks_repository.dart';

class SearchTracksUseCase
    implements UseCase<DataState<List<Track>>, TrackRequestParams> {
  SearchTracksUseCase(this._tracksRepository);

  final TracksRepository _tracksRepository;

  @override
  Future<DataState<List<Track>>> call({required TrackRequestParams params}) {
    return _tracksRepository.searchForTracks(params);
  }
}
