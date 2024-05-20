sealed class Response<T> {
  const Response();
}

class SuccessResponse<T> extends Response<T> {
  const SuccessResponse(this.data);

  final T data;
}

class ErrorResponse<T> extends Response<T> {
  const ErrorResponse(this.error);

  final String error;
}
