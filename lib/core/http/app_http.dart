import 'package:dio/dio.dart';

abstract class AppHttp {
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters, Options? options});
  void addInterceptor(Interceptor interceptor);
}
