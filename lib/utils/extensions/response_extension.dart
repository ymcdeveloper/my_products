import 'package:dio/dio.dart';

extension ResponseExtension on Response {
  bool get isSuccessful => statusCode! >= 200 && statusCode! < 300;

  bool isSuccessfulAndHasData() {
    return isSuccessful && data != null;
  }
}
