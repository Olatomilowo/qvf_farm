class CreateProduceRequestModel {
    CreateProduceRequestModel({
        this.name,
        this.category,
        this.price,
        this.stock,
    });

    final String? name;
    final String? category;
    final int? price;
    final int? stock;

    factory CreateProduceRequestModel.fromJson(Map<String, dynamic> json) => CreateProduceRequestModel(
        name: json["name"],
        category: json["category"],
        price: json["price"],
        stock: json["stock"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "price": price,
        "stock": stock,
    };
}
