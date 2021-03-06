import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fam_ui7/domain/detail_restaurant_response.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FoodDrinkPage extends StatefulWidget {
  const FoodDrinkPage({Key? key}) : super(key: key);

  @override
  _FoodDrinkPageState createState() => _FoodDrinkPageState();
}

class _FoodDrinkPageState extends State<FoodDrinkPage> {
  ScreenUtil screenUtil = ScreenUtil();
  var data = Get.arguments;

  String? type;
  String? id;
  String? name;
  String? description;
  String? city;
  String? address;
  String? pictureId;
  List<Category>? categories;
  Menus? menus;
  double? rating;
  List<CustomerReview>? customerReviews;

  @override
  void initState() {
    type = data['type'];
    id = data['id'];
    name = data['name'];
    description = data['description'];
    city = data['city'];
    address = data['address'];
    pictureId = data['pictureId'];
    categories = data['categories'];
    menus = data['menus'];
    rating = data['rating'];
    customerReviews = data['customerReviews'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        body: Material(
          child: ListView.builder(
            padding: EdgeInsets.only(
              top: screenUtil.setHeight(0),
            ),
            shrinkWrap: true,
            itemCount: (type == 'foods')
                ? menus!.foods!.length
                : menus!.drinks!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  (type == 'foods')
                      ? menus!.foods![index].name.toString()
                      : menus!.drinks![index].name.toString(),
                ),
              );
            },
          ),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text(
                (type == 'foods') ? "Foods List" : "Drinks List",
              ),
            ),
          ];
        },
      ),
    );
  }
}
