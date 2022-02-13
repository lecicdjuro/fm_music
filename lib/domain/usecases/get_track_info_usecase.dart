import 'package:fm_music/core/params/track_request_params.dart';
import 'package:fm_music/core/resources/data_state.dart';
import 'package:fm_music/core/usecases/use_case.dart';
import 'package:fm_music/domain/entities/track_info.dart';
import 'package:fm_music/domain/repositories/tracks_repository.dart';

class GetTrackInfoUseCase
    implements UseCase<DataState<TrackInfo>, TrackRequestParams> {
  GetTrackInfoUseCase(this._tracksRepository);

  final TracksRepository _tracksRepository;

  @override
  Future<DataState<TrackInfo>> call({required TrackRequestParams params}) {
    return _tracksRepository.getTrackInfo(params);
  }
}
