import 'package:flutter/material.dart';

class APIResponse {
  final String message;
  final List data;
  final int code;
  final String errors;
  final List<String> errorArray;
  final String errorMessages;

  APIResponse(
      {required this.message,
      required this.data,
      required this.code,
      required this.errors,
      required this.errorArray,
      required this.errorMessages});

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    List<String> errorArray = [];
    String errorMessages = '';

    String multiLineString(List<String> arr) {
      StringBuffer sb = StringBuffer();
      for (String line in arr) {
        sb.write(line + '\n');
      }
      return sb.toString().substring(0, sb.length - 2);
    }

    if (json['code'] == 422 || json['code'] == 412) {
      Map errors = json['code'] == 412 ? json['data'] : json['errors'];
      if (errors.isNotEmpty) {
        errors.forEach((key, val) {
          errorArray.add(val[0]);
        });
        errorMessages = multiLineString(errorArray);
        debugPrint(errorMessages);
      }
    } else {
      if (json['code'] >= 400) {}
    }

    return APIResponse(
      message: json['message'] ?? json['msg'],
      data: json['data'],
      code: json['code'],
      errors: json['errors'],
      errorArray: errorArray,
      errorMessages: errorMessages,
    );
  }
}
