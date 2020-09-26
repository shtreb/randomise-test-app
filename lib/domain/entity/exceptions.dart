import 'package:flutter/material.dart';

class CustomException<T> implements Exception {
  T data;
  Exception exception;

  CustomException({
    this.data,
    this.exception
  });
}

class ApiException implements Exception {

  int code;
  String mess;

  ApiException({
    @required this.code,
    @required this.mess
  }) :
        assert(code != null, 'ApiException: code must be not empty'),
        assert(mess != null && mess.isNotEmpty, 'ApiException: mess must be not empty');

}

class ParseException implements Exception {

  ParseException();

}