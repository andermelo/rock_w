import 'package:dio/dio.dart';
import 'package:rock_w/core/http/app_http.dart';

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
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }
}
