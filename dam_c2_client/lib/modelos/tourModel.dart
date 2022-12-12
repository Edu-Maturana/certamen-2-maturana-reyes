import 'dart:convert';

class Datos {
  int id;
  String name;
  String city;
  String description;
  String img;
  int price;
  String schedule;
  int rating;

  Datos({
    this.id,
    this.name,
    this.city,
    this.description,
    this.img,
    this.price,
    this.schedule,
    this.rating,
  });

  factory Datos.fromJson(Map<String, dynamic> json) {
    return Datos(
      id: json["id"],
      name: json["name"],
      city: json["city"],
      description: json["description"],
      img: json["img"],
      price: json["price"],
      schedule: json["schedule"],
      rating: json["rating"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
        "description": description,
        "img": img,
        "price": price,
        "schedule": schedule,
        "rating": rating,
      };

  @override
  String toString() {
    return 'Datos{id: $id, name: $name, city: $city, description: $description, img: $img, price: $price, schedule: $schedule, rating: $rating}';
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
  int id;

  Post({
    this.id,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
      };

  @override
  String toString() {
    return 'Datos{id: $id}';
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
