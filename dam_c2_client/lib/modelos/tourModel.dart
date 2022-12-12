import 'dart:convert';

class Datos {
  int id;
  String name;
  String city;
  String description;
  int price;
  String shedule;
  int rating;

  Datos({
    this.id,
    this.name,
    this.city,
    this.description,
    this.price,
    this.shedule,
    this.rating,
  });

  factory Datos.fromJson(Map<String, dynamic> json) {
    return Datos(
      id: json["id"],
      name: json["name"],
      city: json["city"],
      description: json["description"],
      price: json["price"],
      shedule: json["shedule"],
      rating: json["rating"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
        "description": description,
        "price": price,
        "shedule": shedule,
        "rating": rating,
      };

  @override
  String toString() {
    return 'Datos{id: $id, name: $name, city: $city, description: $description, price: $price, shedule: $shedule, rating: $rating}';
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
  String name;

  Post({
    this.name,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
      };

  @override
  String toString() {
    return 'Datos{name: $name}';
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
