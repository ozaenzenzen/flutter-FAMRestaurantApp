import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_fam_ui7/domain/list_restaurant_response.dart';
import 'package:flutter_fam_ui7/utils/app_asset.dart';

class DataJSON {
  Future<ListRestaurantResponse> getData() async {
    var response = await rootBundle.loadString(AppAsset.dataJson);
    var jsonObject = json.decode(response);
    ListRestaurantResponse listRestaurantResponse =
        ListRestaurantResponse.fromJson(jsonObject);
    return listRestaurantResponse;
  }
}
