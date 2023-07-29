// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

class DioRequestInspectorExample extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add your onRequest logic here
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    // Add your onResponse logic here
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // Add your onError logic here
    super.onError(err, handler);
  }
}
