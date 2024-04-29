class ApiErrorResponse {
  final String message;
  final String? error;
  final Map<String, dynamic>? data;

  const ApiErrorResponse(
      {this.message = "Request failed", this.error = "", this.data = const {}});
}
