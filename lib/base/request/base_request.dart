import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:ekyc/const/const.dart';

import '../../application/app_controller.dart';
import '../base.dart';

enum RequestMethod { POST, GET }

class BaseRequest {
  static Dio dio = _getBaseDio();

  static Dio _getBaseDio() {
    Dio dio = Dio();

    dio.options.baseUrl = AppUrl.baseUrl;
    dio.options.connectTimeout = AppConst.requestTimeOut;
    dio.options.receiveTimeout = AppConst.requestTimeOut;

    if (AppUrl.baseUrl.startsWith("https://")) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }

    return dio;
  }

  Future<dynamic> sendRequest(
    String action,
    RequestMethod requestMethod, {
    dynamic jsonMap,
    bool isByte = false,
    bool isUploadService = false,
    bool isQueryParametersPost = false,
    bool getErrorApi = true,
    required BaseGetxController controller,
    String? urlOther,
  }) async {
    Response response;

    Map<String, dynamic> headers =
        await getBaseHeader(isUploadService: isUploadService);
    Options options;
    if (!isByte) {
      options = Options(headers: headers, method: requestMethod.toString());
    } else {
      options = Options(
          responseType: ResponseType.bytes,
          headers: headers,
          method: requestMethod.toString());
    }

    if (!action.startsWith('/')) {
      action = "/" + action;
    }

    String url = urlOther ?? (AppUrl.baseUrl + action);

    CancelToken _cancelToken = CancelToken();
    controller.addCancelToken(_cancelToken);
    try {
      if (requestMethod == RequestMethod.POST) {
        if (isQueryParametersPost) {
          response = await dio.post(url,
              queryParameters: jsonMap,
              options: options,
              cancelToken: _cancelToken);
        } else {
          response = await dio.post(url,
              data: jsonMap, options: options, cancelToken: _cancelToken);
        }
      } else {
        response = await dio.get(url,
            options: options,
            queryParameters: jsonMap,
            cancelToken: _cancelToken);
      }
      return response.data;
    } catch (e) {
      controller.cancelRequest(_cancelToken);
      print(e);
      if (getErrorApi) controller.onError(e);
    }
  }

  Future<Map<String, String?>> getBaseHeader(
      {bool sendToken = true, bool isUploadService = false}) async {
    Map<String, String?> headers = Map<String, String?>();

    if (!isUploadService) {
      headers['Content-Type'] = "application/json;charset=UTF-8";
    }

    if (sendToken || isUploadService) {
      headers['Authorization'] = HIVE_APP.get(AppKey.keyToken) ?? '';
    }

    return headers;
  }

  void cancelRequest(CancelToken cancelToken) {
    if (!cancelToken.isCancelled)
      cancelToken.cancel('Cancel when close controller!!!');
  }
}
