import 'package:dio/dio.dart';
import 'package:fm_music/data_provider/model/track.dart';
import 'package:fm_music/data_provider/model/track_details.dart';
import 'package:fm_music/error/api_exceptions.dart';
import 'package:fm_music/networking/dio_client.dart';

class FMRequests {
  static Future<List<Track>> performTrackSearch(
      {required String searchTerm}) async {
    try {
      Response response =
          await DioClient().dioInstance.get('', queryParameters: {
        'method': 'track.search',
        'track': searchTerm,
      });
      final List tracksJSON = response.data['results']['trackmatches']['track'];
      return tracksJSON.map((trackJSON) => Track.fromJson(trackJSON)).toList();
    } catch (error) {
      if (error is DioError) {
        throw APIException(
            errorCode: error.response?.statusCode,
            message: error.response?.statusMessage);
      } else {
        rethrow;
      }
    }
  }

  static Future<TrackDetails> getTrackInfo(
      {required String artist, required String trackName}) async {
    try {
      Response response = await DioClient().dioInstance.get('',
          queryParameters: {
            'method': 'track.getinfo',
            'track': trackName,
            'artist': artist
          });
      return TrackDetails.fromJson(response.data['track']);
    } catch (error) {
      if (error is DioError) {
        throw APIException(
            errorCode: error.response?.statusCode, message: error.message);
      } else {
        rethrow;
      }
    }
  }
}
