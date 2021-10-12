// class ListRestaurantResponse {
//   ListRestaurantResponse({
//     this.restaurants,
//   });

//   List<Restaurant>? restaurants;

//   factory ListRestaurantResponse.fromJson(Map<String, dynamic> json) =>
//       ListRestaurantResponse(
//         restaurants: List<Restaurant>.from(
//             json["restaurants"].map((x) => Restaurant.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "restaurants": List<dynamic>.from(restaurants!.map((x) => x.toJson())),
//       };
// }

// class Restaurant {
//   Restaurant({
//     this.id,
//     this.name,
//     this.description,
//     this.pictureId,
//     this.city,
//     this.rating,
//     this.menus,
//   });

//   String? id;
//   String? name;
//   String? description;
//   String? pictureId;
//   String? city;
//   double? rating;
//   Menus? menus;

//   factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         pictureId: json["pictureId"],
//         city: json["city"],
//         rating: json["rating"].toDouble(),
//         menus: Menus.fromJson(json["menus"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "pictureId": pictureId,
//         "city": city,
//         "rating": rating,
//         "menus": menus!.toJson(),
//       };
// }

// class Menus {
//   Menus({
//     this.foods,
//     this.drinks,
//   });

//   List<Food>? foods;
//   List<Drink>? drinks;

//   factory Menus.fromJson(Map<String, dynamic> json) => Menus(
//         foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
//         drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "foods": List<dynamic>.from(foods!.map((x) => x.toJson())),
//         "drinks": List<dynamic>.from(drinks!.map((x) => x.toJson())),
//       };
// }

// class Drink {
//   Drink({
//     this.name,
//   });

//   String? name;

//   factory Drink.fromJson(Map<String, dynamic> json) => Drink(
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//       };
// }
// class Food {
//   Food({
//     this.name,
//   });

//   String? name;

//   factory Food.fromJson(Map<String, dynamic> json) => Food(
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//       };
// }
class ListRestaurantResponse {
  ListRestaurantResponse({
    this.error,
    this.message,
    this.count,
    this.restaurants,
  });

  bool? error;
  String? message;
  int? count;
  List<Restaurant>? restaurants;

  factory ListRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      ListRestaurantResponse(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": List<dynamic>.from(restaurants!.map((x) => x.toJson())),
      };
}

class Restaurant {
  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}
