//Response call back
class ResponseWrapper {
  final bool status;
  final String message;
  final int statusCode;
  final String responseData;
  ResponseWrapper(this.status, this.message, this.statusCode, this.responseData);

  ResponseWrapper.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        statusCode = json['statusCode'],
        responseData = json['data'];

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'statusCode': statusCode,
    'responseData': responseData,
  };
}
