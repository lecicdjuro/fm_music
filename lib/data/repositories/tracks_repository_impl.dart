import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fm_music/core/params/track_request_params.dart';
import 'package:fm_music/core/resources/data_state.dart';
import 'package:fm_music/data/data_sources/remote/fm_search_api_service.dart';
import 'package:fm_music/domain/entities/track.dart';
import 'package:fm_music/domain/entities/track_info.dart';
import 'package:fm_music/domain/repositories/tracks_repository.dart';

class TracksRepositoryImpl implements TracksRepository {
  const TracksRepositoryImpl(this._fmSearchApiService);

  final FMSearchApiService _fmSearchApiService;

  @override
  Future<DataState<List<Track>>> searchForTracks(
      TrackRequestParams params) async {
    try {
      final httpResponse =
          await _fmSearchApiService.searchTracks(params.method, params.track);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.tracks);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioErrorType.response,
          requestOptions: httpResponse.response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<TrackInfo>> getTrackInfo(TrackRequestParams params) async {
    try {
      final httpResponse = await _fmSearchApiService.getTrackIno(
        params.method,
        params.artist,
        params.track,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.trackInfo);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioErrorType.response,
          requestOptions: httpResponse.response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
