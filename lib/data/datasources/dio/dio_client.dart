import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../core/strings/constants.dart';
import 'api_response.dart';

class DioClient {
  final Dio _dio = Dio();
  DioClient() {
    _dio.options.baseUrl = kApiUrl;
    _dio.options.connectTimeout = 30000;
    _dio.options.receiveTimeout = 30000;
  }

  Future<APIResponse> publicGet(String uri, {Map<String, dynamic>? data}) async {
    _dio.options.headers["content-type"] = 'application/json';
    _dio.options.headers["App-Origin"] = kAppOrigin;
    _dio.options.headers["PubKey"] = kPubKey;

    final response = await _dio.get(uri, queryParameters: data);
    debugPrint('response is $response');
    return _process(response);
  }

  APIResponse _process(Response response) {
    if (response.statusCode == 200) {
      return APIResponse.fromJson(response.data);
    } else {
      var body = response.data;
      body['code'] = response.statusCode;
      return APIResponse.fromJson(body);
    }
  }
}