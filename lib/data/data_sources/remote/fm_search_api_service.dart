import "package:dio/dio.dart";
import 'package:fm_music/core/utils/constants.dart';
import 'package:fm_music/data/models/search_tracks_response_model.dart';
import 'package:fm_music/data/models/track_info_response_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'fm_search_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class FMSearchApiService {
  factory FMSearchApiService(Dio dio, {String baseUrl}) = _FMSearchApiService;

  @GET('/')
  Future<HttpResponse<SearchTracksResponseModel>> searchTracks(
      @Query("method") String? method,
      @Query("track") String? track);

  @GET('/')
  Future<HttpResponse<TrackInfoResponseModel>> getTrackIno(
      @Query("method") String method,
      @Query("artist") String? artist,
      @Query("track") String? track);
}
