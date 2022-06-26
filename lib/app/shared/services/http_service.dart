// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';

import '../utils/logger.dart';


enum Method { POST, GET, PUT, DELETE, PATCH }

const BASE_URL = "http://demo6772422.mockable.io";


class HttpService {
  
  Dio? _dio;

  static header() => {
        "Content-Type": "application/json",
      };

  String errorMessage = "";

  Future<HttpService> init() async {
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: 10000,
      receiveTimeout: 15000,
    ));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          logger.i(
              "REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}"
              "=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          logger
              .i("RESPONSE[${response.statusCode}] => DATA: ${response.data}");
          return handler.next(response);
        },
        onError: (err, handler) {
          if (err.response?.statusCode != null) {
            logger.i("Error [${err.response?.statusCode}]");
            errorMessage = err.response?.data['error'];
          } else {
            logger.i("Error [${err.error}]");
            errorMessage = err.error.toString();
          }

          return handler.next(err);
        },
      ),
    );
  }

  Future<dynamic> requestPublic(
      {required String url,
      required Method method,
      Map<String, dynamic>? params}) async {
    Response response;

    try {
      if (method == Method.POST) {
        response = await _dio!.post(url, data: params);
      } else if (method == Method.DELETE) {
        response = await _dio!.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio!.patch(url);
      } else {
        response = await _dio!.get(url, queryParameters: params);
      }

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something does wen't wrong");
      }
    } on SocketException catch (e) {
      logger.e(e);
      throw Exception("No Internet Connection");
    } on FormatException catch (e) {
      logger.e(e);
      throw Exception("Bad response format");
    } on DioError catch (e) {
      logger.e(e);
      if (e.type == DioErrorType.connectTimeout) {
        // ...
        logger.i("CONNECTION TIMED OUT");
        throw Exception("CONNECTION TIMED OUT");
      }
      if (e.type == DioErrorType.receiveTimeout) {
        // ...
        logger.i("RECEIVE TIME OUT");
        throw Exception("RECEIVE TIME OUT");
      }

      throw Exception(e);
    } catch (e) {
      logger.e(e);
      throw Exception("Something wen't wrong");
    }
  }

  Future<dynamic> requestProtected(
      {required String url,
      required Method method,
      required String token,
      Map<String, dynamic>? params}) async {
    Response response;

    try {
      if (method == Method.POST) {
        response = await _dio!.post(url,
            data: params,
            options: Options(headers: {
              "Content-Type": "application/json",
              "authorization": 'Bearer $token'
            }));
      } else if (method == Method.DELETE) {
        response = await _dio!.delete(url,
            options: Options(headers: {
              "Content-Type": "application/json",
              "authorization": 'Bearer $token'
            }));
      } else if (method == Method.PATCH) {
        response = await _dio!.patch(url,
            options: Options(headers: {
              "Content-Type": "application/json",
              "authorization": 'Bearer $token'
            }));
      } else {
        response = await _dio!.get(url,
            queryParameters: params,
            options: Options(headers: {
              "Content-Type": "application/json",
              "authorization": 'Bearer $token'
            }));
      }

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something does wen't wrong");
      }
    } on SocketException catch (e) {
      logger.e(e);
      throw Exception("Not Internet Connection");
    } on FormatException catch (e) {
      logger.e(e);
      throw Exception("Bad response format");
    } on DioError catch (e) {
      logger.e(e);
      if (e.type == DioErrorType.connectTimeout) {
        // ...
        logger.i("CONNECTION TIMED OUT");
        throw Exception("CONNECTION TIMED OUT");
      }
      if (e.type == DioErrorType.receiveTimeout) {
        // ...
        logger.i("RECEIVE TIME OUT");
        throw Exception("RECEIVE TIME OUT");
      }
      throw Exception(e);
    } catch (e) {
      logger.e(e);
      throw Exception("Something wen't wrong");
    }
  }
}
