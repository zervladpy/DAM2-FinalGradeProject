class AppException implements Exception {
  const AppException(this.error);

  final String error;
}
