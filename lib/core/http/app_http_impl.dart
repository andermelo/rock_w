import 'package:dio/dio.dart';
import 'package:rock_w/core/http/app_http.dart';
import 'package:rock_w/core/logger/app_logger.dart';

class AppHttpImpl implements AppHttp {
  final Dio _dio;

  AppHttpImpl({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = await _dio.get(path,
          queryParameters: queryParameters, options: options);
      return response;
    } on DioException catch (e, s) {
      AppLogger.instance
          .logError('Error in AppHttp GET', exception: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }
}
