import "package:dio/dio.dart";
import 'package:fm_music/config/config.dart' as config;

class DioClient {
  factory DioClient() {
    _singleton ??= DioClient._internal();

    return _singleton!;
  }

  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 5000,
      ),
    )..interceptors.add(FMInterceptor());
  }

  static DioClient? _singleton;

  late Dio _dio;

  Dio get dioInstance => _dio;
}

class FMInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters
        .addAll({"api_key": config.apiKey, "format": "json"});
    return super.onRequest(options, handler);
  }
}
