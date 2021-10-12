// ignore_for_file: constant_identifier_names

class Urls {
  static const String BASE_API = "https://restaurant-api.dicoding.dev";

  static const String LIST_RESTAURANT = BASE_API + "/list";
  
  // how to use: BASE_API + "/detail/id";
  static const String DETAIL_RESTAURANT = BASE_API + "/detail";

  // how to use: BASE_API + "/search?q=query";
  static const String SEARCH_RESTAURANT = BASE_API + "/search?q=";

  static const String REVIEW_RESTAURANT = BASE_API + "/review";

  static const String IMAGE_SMALL =
      "https://restaurant-api.dicoding.dev/images/small";
  static const String IMAGE_MEDIUM =
      "https://restaurant-api.dicoding.dev/images/medium";
  static const String IMAGE_LARGE =
      "https://restaurant-api.dicoding.dev/images/large";
}
