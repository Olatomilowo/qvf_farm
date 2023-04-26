class GetProduceModel {
    GetProduceModel({
        this.produceByCategory,
    });

    final ProduceByCategory? produceByCategory;

    factory GetProduceModel.fromJson(Map<String, dynamic> json) => GetProduceModel(
        produceByCategory: ProduceByCategory.fromJson(json["produceByCategory"]),
    );

    Map<String, dynamic> toJson() => {
        "produceByCategory": produceByCategory!.toJson(),
    };
}

class ProduceByCategory {
    ProduceByCategory({
        this.fishery,
        this.crops,
        this.poultry,
    });

    final List<Crop>? fishery;
    final List<Crop>? crops;
    final List<Crop>? poultry;

    factory ProduceByCategory.fromJson(Map<String, dynamic> json) => ProduceByCategory(
        fishery: List<Crop>.from(json["Fishery"].map((x) => Crop.fromJson(x))),
        crops: List<Crop>.from(json["Crops"].map((x) => Crop.fromJson(x))),
        poultry: List<Crop>.from(json["Poultry"].map((x) => Crop.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Fishery": List<dynamic>.from(fishery!.map((x) => x.toJson())),
        "Crops": List<dynamic>.from(crops!.map((x) => x.toJson())),
        "Poultry": List<dynamic>.from(poultry!.map((x) => x.toJson())),
    };
}

class Crop {
    Crop({
        this.id,
        this.name,
        this.category,
        this.price,
        this.stock,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    final String? id;
    final String? name;
    final String? category;
    final int? price;
    final int? stock;
    final String? createdAt;
    final String? updatedAt;
    final int? v;

    factory Crop.fromJson(Map<String, dynamic> json) => Crop(
        id: json["_id"],
        name: json["name"],
        category: json["category"],
        price: json["price"],
        stock: json["stock"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "category": category,
        "price": price,
        "stock": stock,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
    };
}
