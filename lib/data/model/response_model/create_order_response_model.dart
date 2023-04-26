class CreateOrderResponseModel {
    CreateOrderResponseModel({
        this.message,
        this.newOrder,
    });

    final String? message;
    final NewOrder? newOrder;

    factory CreateOrderResponseModel.fromJson(Map<String, dynamic> json) => CreateOrderResponseModel(
        message: json["message"],
        newOrder: NewOrder.fromJson(json["newOrder"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "newOrder": newOrder!.toJson(),
    };
}

class NewOrder {
    NewOrder({
        this.userId,
        this.name,
        this.price,
        this.quantity,
        this.total,
        this.id,
        this.v,
    });

    final String? userId;
    final String? name;
    final int? price;
    final int? quantity;
    final int? total;
    final String? id;
    final int? v;

    factory NewOrder.fromJson(Map<String, dynamic> json) => NewOrder(
        userId: json["userId"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        total: json["total"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "price": price,
        "quantity": quantity,
        "total": total,
        "_id": id,
        "__v": v,
    };
}
