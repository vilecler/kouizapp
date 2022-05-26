class LoginRequiredException implements Exception {
  final String cause;
  LoginRequiredException(this.cause);
}