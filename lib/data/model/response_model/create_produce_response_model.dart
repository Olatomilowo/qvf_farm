class CreateProduceResponseModel {
    CreateProduceResponseModel({
        this.error,
        this.message,
    });

    final String? error;
    final String? message;

    factory CreateProduceResponseModel.fromJson(Map<String, dynamic> json) => CreateProduceResponseModel(
        error: json["error"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
    };
}
