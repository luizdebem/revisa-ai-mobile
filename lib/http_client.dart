import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class HttpClient {
  static Dio dio() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://localhost:3001",
    );

    final _dio = Dio(options);
    var cookieJar = CookieJar();
    _dio.interceptors.add(CookieManager(cookieJar));
    // final adapter = BrowserHttpClientAdapter();
    // adapter.withCredentials = true;
    // _dio.httpClientAdapter = adapter;
    return _dio;
  }
}
