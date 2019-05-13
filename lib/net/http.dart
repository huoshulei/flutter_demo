import 'dart:io';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';

final debug = !bool.fromEnvironment("dart.vm.product");
final baseUrl = 'http://apidev.sparke.cn/';

final Dio _dio = Dio(
  BaseOptions(
    method: "get",
    baseUrl: baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 5000,
    followRedirects: true,
  ),
);

/// 设置错误统一处理
void setInterceptor() {
  _dio.interceptors.add(InterceptorsWrapper(
    onRequest: (request) {
      return request;
    },
    onResponse: (response) {
      return response;
    },
    onError: (error) async {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        error.message = '网络连接异常，请检查手机网络设置';
      } else if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        error.message = '链解超时，请检查网络设置';
      } else {
        error.message = '未知错误${error.message}';
      }
    },
  ));
  _dio.interceptors.add(LogInterceptor(
    request: debug,
    requestHeader: debug,
    requestBody: debug,
    responseBody: debug,
    responseHeader: debug,
    error: true,
  ));
}

///设置请求头
void setHeader(Map<String, String> header) {
  _dio.options.headers = header;
}

Future<Response<Map<String, dynamic>>> _httpJson(String method, String url,
    {Map<String, dynamic> data, bool isJson = true}) async {
  setInterceptor();
  if (method == 'get') {
    isJson = false;
    if (data == null) {
      data = {};
    }
  }

  ///根据请求类型设置 请求体用json 表单直接拼接
  Options op;
  if (isJson) {
    op = Options(contentType: ContentType.parse('application/json'));
  } else {
    op = Options(
        contentType: ContentType.parse('application/x-www-form-urlencoded'));
  }
  op.method = method;
  return _dio.request<Map<String, dynamic>>(url, data: data, options: op);
}

Future<Map<String, dynamic>> logicalSuccessTransform<T>(
    Response<Map<String, dynamic>> resp) {
  if (resp.data == null) {
    return throw HttpError(-1, '返回结果为空');
  } else if (resp.data['code'] == 200) {
    if (resp.data['results']['ret'] == 100) {
      return Future.value(resp.data['results']);
    } else {
      throw HttpError(resp.data['results']['ret'], resp.data['results']['msg']);
    }
  }
  return throw HttpError(-1, '数据格式不正确');
}

///get
Future<Map<String, dynamic>> getJson(String url, Map<String, dynamic> data) =>
    _httpJson('get', url, data: data).then(logicalSuccessTransform);

///get form
Future<Map<String, dynamic>> getForm(String url, Map<String, dynamic> data) =>
    _httpJson('get', url, data: data, isJson: false)
        .then(logicalSuccessTransform);

///post json
Future<Map<String, dynamic>> postJson(String url, Map<String, dynamic> data) =>
    _httpJson('post', url, data: data).then(logicalSuccessTransform);

///post form
Future<Map<String, dynamic>> postForm(String url, Map<String, dynamic> data) =>
    _httpJson('post', url, data: data, isJson: false)
        .then(logicalSuccessTransform);

class HttpError  {
  int code;
  String message;

  HttpError(this.code, this.message) ;
}
