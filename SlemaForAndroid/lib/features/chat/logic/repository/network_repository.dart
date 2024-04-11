import 'package:dio/dio.dart';

mixin NetworkRepository {
  Dio createDioInstance() {
    final Dio dio = Dio();
    dio.options.baseUrl = 'http://10.0.2.2:8081';
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
    return dio;
  }
}
