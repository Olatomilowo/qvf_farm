class UpdateOrderRequestModel {
    UpdateOrderRequestModel({
        this.name,
        this.category,
        this.price,
        this.quantity,
    });

    final String? name;
    final String? category;
    final int? price;
    final int? quantity;

    factory UpdateOrderRequestModel.fromJson(Map<String, dynamic> json) => UpdateOrderRequestModel(
        name: json["name"],
        category: json["category"],
        price: json["price"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "price": price,
        "quantity": quantity,
    };
}
