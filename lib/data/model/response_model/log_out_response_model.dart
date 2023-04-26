class LogOutResponseModel {
    LogOutResponseModel({
        this.message,
    });

    final String? message;

    factory LogOutResponseModel.fromJson(Map<String, dynamic> json) => LogOutResponseModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}