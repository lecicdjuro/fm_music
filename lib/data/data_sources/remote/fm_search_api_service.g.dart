// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fm_search_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _FMSearchApiService implements FMSearchApiService {
  _FMSearchApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://ws.audioscrobbler.com/2.0/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<SearchTracksResponseModel>> searchTracks(
      method, track) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'method': method,
      r'track': track
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<SearchTracksResponseModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SearchTracksResponseModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<TrackInfoResponseModel>> getTrackIno(
      method, artist, track) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'method': method,
      r'artist': artist,
      r'track': track
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<TrackInfoResponseModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TrackInfoResponseModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
