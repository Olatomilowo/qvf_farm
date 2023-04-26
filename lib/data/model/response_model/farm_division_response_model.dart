class FarmDivisionResponseModel {
    FarmDivisionResponseModel({
        this.farmDivisions,
    });

    final List<FarmDivision>? farmDivisions;

    factory FarmDivisionResponseModel.fromJson(Map<String, dynamic> json) => FarmDivisionResponseModel(
        farmDivisions: List<FarmDivision>.from(json["farm_divisions"].map((x) => FarmDivision.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "farm_divisions": List<dynamic>.from(farmDivisions!.map((x) => x.toJson())),
    };
}

class FarmDivision {
    FarmDivision({
        this.name,
        this.description,
        this.url,
    });

    final String? name;
    final String? description;
    final String? url;

    factory FarmDivision.fromJson(Map<String, dynamic> json) => FarmDivision(
        name: json["name"],
        description: json["description"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "url": url,
    };
}
