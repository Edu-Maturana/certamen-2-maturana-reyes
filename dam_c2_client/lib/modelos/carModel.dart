import 'dart:convert';

class Datos {
  String vin;
  String brand;
  String model;
  int year;
  int price;

  Datos({
    this.vin,
    this.brand,
    this.model,
    this.year,
    this.price,
  });

  factory Datos.fromJson(Map<String, dynamic> json) {
    return Datos(
      vin: json["vin"],
      brand: json["brand"],
      model: json["model"],
      year: json["year"],
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() => {
        "vin": vin,
        "brand": brand,
        "model": model,
        "year": year,
        "price": price,
      };

  @override
  String toString() {
    return 'Datos{vin: $vin, brand: $brand, model: $model, year: $year, price: $price}';
  }
}

Datos datosFromJson(String strJson) {
  final str = json.decode(strJson);
  return Datos.fromJson(str);
}

String datosToJson(Datos data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Post {
  String vin;

  Post({
    this.vin,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      vin: json["vin"],
    );
  }

  Map<String, dynamic> toJson() => {
        "vin": vin,
      };

  @override
  String toString() {
    return 'Datos{vin: $vin}';
  }
}

Datos postFromJson(String strJson) {
  final str = json.decode(strJson);
  return Datos.fromJson(str);
}

String postToJson(Post post) {
  final dyn = post.toJson();
  return json.encode(dyn);
}
