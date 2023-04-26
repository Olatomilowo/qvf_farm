class SignUpRequestModel {
    SignUpRequestModel({
        this.firstname,
        this.lastname,
        this.email,
        this.phoneNumber,
        this.password,
    });

    final String? firstname;
    final String? lastname;
    final String? email;
    final String? phoneNumber;
    final String? password;

    factory SignUpRequestModel.fromJson(Map<String, dynamic> json) => SignUpRequestModel(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
    };
}
