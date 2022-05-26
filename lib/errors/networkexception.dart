import 'package:kouizapp/models/httperror.dart';

class NetworkException implements Exception {
  final String cause;
  final HttpError error;
  NetworkException(this.cause, this.error);
}