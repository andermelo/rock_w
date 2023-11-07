import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rock_w/core/database/app_database_impl.dart';

class AppCacheInterceptor extends InterceptorsWrapper {
  final AppDatabaseImpl appDatabase;
  final Connectivity connectivity;

  AppCacheInterceptor({required this.appDatabase, required this.connectivity});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var hasConnection =
        await connectivity.checkConnectivity() != ConnectivityResult.none;
    var key = _generateCacheKey(options);

    if (!hasConnection) {
      var cachedData = await appDatabase.getData(key);
      if (cachedData != null) {
        handler.resolve(Response(
          requestOptions: options,
          data: cachedData['data'],
          statusCode: 200,
        ));
      } else {
        handler.reject(DioException(
          requestOptions: options,
          error: 'No internet connection and no cached data available.',
        ));
      }
    } else {
      handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final key = _generateCacheKey(response.requestOptions);

    final dataWithTimestamp = {
      'data': response.data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
    await appDatabase.saveData(key, dataWithTimestamp);

    return handler.next(response);
  }

  String _generateCacheKey(RequestOptions options) {
    return options.uri.toString();
  }
}
