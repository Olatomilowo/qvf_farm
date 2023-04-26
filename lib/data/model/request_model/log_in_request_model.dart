class LogInRequestModel {
    LogInRequestModel({
        this.email,
        this.password,
    });

    final String? email;
    final String? password;

    factory LogInRequestModel.fromJson(Map<String, dynamic> json) => LogInRequestModel(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
