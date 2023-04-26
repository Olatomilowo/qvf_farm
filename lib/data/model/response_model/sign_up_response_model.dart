class SignUpResponseModel {
  SignUpResponseModel({
    required this.message,
  });

  final String message;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        message: json["message"]
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}

