class ClientResponse {
  final int statusCode;
  final dynamic data;

  ClientResponse({
    required this.statusCode,
    required this.data,
  });
}