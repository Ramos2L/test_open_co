enum StatusCode {
  ok(200),
  error(400),
  notFound(404);

  final int code;

  const StatusCode(this.code);
}