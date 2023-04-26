class LogInResponseModel {
    LogInResponseModel({
        this.message,
        this.token,
    });

    final String? message;
    final String? token;

    factory LogInResponseModel.fromJson(Map<String, dynamic> json) => LogInResponseModel(
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
    };
}
