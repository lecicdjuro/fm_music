import 'package:flutter/material.dart';

const int baseErrorCode = 0;

///base exception class
abstract class BaseException implements Exception {
  BaseException(this.errorCode);

  int? errorCode;

  String getErrorMessage();

  void handleErrorWithSnackBar(BuildContext context) {
    final String error = getErrorMessage();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(error),
    ));
  }
}
