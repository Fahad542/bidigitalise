class AuthResponse {
  final Data data;
  final String generatedAt;
  final String statusCode;
  final String userMessage;

  AuthResponse({
    required this.data,
    required this.generatedAt,
    required this.statusCode,
    required this.userMessage
  });

  // Factory constructor to create an instance from JSON
  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      data: Data.fromJson(json['data']),
      generatedAt: json['generatedAt'],
      statusCode: json['statusCode'],
        userMessage:json['userMessage']
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'generatedAt': generatedAt,
      'statusCode': statusCode,
      'userMessage':userMessage
    };
  }
}

class Data {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  Data({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  // Factory constructor to create an instance from JSON
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      expiresIn: json['expiresIn'],
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
    };
  }
}
