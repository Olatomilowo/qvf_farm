class UpdateOrderResponseModel {
    UpdateOrderResponseModel({
        this.message,
        this.updatedOrder,
    });

    final String? message;
    final UpdatedOrder? updatedOrder;

    factory UpdateOrderResponseModel.fromJson(Map<String, dynamic> json) => UpdateOrderResponseModel(
        message: json["message"],
        updatedOrder: UpdatedOrder.fromJson(json["updatedOrder"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "updatedOrder": updatedOrder!.toJson(),
    };
}

class UpdatedOrder {
    UpdatedOrder({
        this.id,
        this.userId,
        this.name,
        this.price,
        this.quantity,
        this.total,
        this.v,
    });

    final String? id;
    final String? userId;
    final String? name;
    final int? price;
    final int? quantity;
    final int? total;
    final int? v;

    factory UpdatedOrder.fromJson(Map<String, dynamic> json) => UpdatedOrder(
        id: json["_id"],
        userId: json["userId"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        total: json["total"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "name": name,
        "price": price,
        "quantity": quantity,
        "total": total,
        "__v": v,
    };
}
