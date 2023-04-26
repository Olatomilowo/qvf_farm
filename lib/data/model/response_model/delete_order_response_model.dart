class DeleteOrderResponseModel {
    DeleteOrderResponseModel({
        this.message,
        this.deletedOrder,
    });

    final String? message;
    final DeletedOrder? deletedOrder;

    factory DeleteOrderResponseModel.fromJson(Map<String, dynamic> json) => DeleteOrderResponseModel(
        message: json["message"],
        deletedOrder: DeletedOrder.fromJson(json["deletedOrder"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "deletedOrder": deletedOrder!.toJson(),
    };
}

class DeletedOrder {
    DeletedOrder({
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

    factory DeletedOrder.fromJson(Map<String, dynamic> json) => DeletedOrder(
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
