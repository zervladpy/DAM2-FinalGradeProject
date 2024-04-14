/// Contenedorize the response of the API request.
class Response<T> {
  final T? data;
  final String? error;
  final ResponseStatus status;

  const Response({this.data, this.error, required this.status});

  factory Response.success(
    T data, {
    String code = '200',
  }) {
    return Response(
      data: data,
      status: Success(code),
    );
  }

  factory Response.failure(
    String error, {
    String code = '400',
  }) {
    return Response(
      error: error,
      status: Failure(code),
    );
  }
}

class ResponseStatus {
  final String code;

  const ResponseStatus(this.code);
}

class Success extends ResponseStatus {
  const Success(super.code);
}

class Failure extends ResponseStatus {
  const Failure(super.code);
}
