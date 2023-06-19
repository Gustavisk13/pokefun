import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();
  final String baseUrl;

  DioClient({required this.baseUrl}) {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(ApiInterceptor());
  }

  Future<Response> get(String path) async {
    return await _dio.get(path);
  }
}

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = 'application/json';
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      return super.onResponse(response, handler);
    }
    super.onResponse(response, handler);
  }
}
