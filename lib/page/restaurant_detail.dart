import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fam_ui7/domain/list_restaurant_response.dart';
import 'package:flutter_fam_ui7/page/fooddrink_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RestaurantDetail extends StatefulWidget {
  const RestaurantDetail({Key? key}) : super(key: key);

  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  ScreenUtil screenUtil = ScreenUtil();

  var data = Get.arguments;

  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;
  Menus? menus;

  @override
  Widget build(BuildContext context) {
    id = data['id'];
    name = data['name'];
    description = data['description'];
    pictureId = data['pictureId'];
    city = data['city'];
    rating = data['rating'];
    menus = data['menus'];
    // Menus menus2 = Menus.fromJson(menus);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Material(
          color: Colors.transparent,
          child: IconButton(
            icon: const Icon(
              CupertinoIcons.back,
              color: CupertinoColors.activeBlue,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        middle: const Text("Restaurant App Details"),
        trailing: Material(
          color: Colors.transparent,
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: CupertinoColors.activeBlue,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            // title: Text(
            //   name.toString(),
            // ),
            centerTitle: true,
            leading: Container(),
            backgroundColor: Colors.transparent,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                pictureId.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: screenUtil.setHeight(5),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: screenUtil.setWidth(10),
                    vertical: screenUtil.setWidth(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name.toString(),
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navLargeTitleTextStyle,
                      ),
                      SizedBox(
                        height: screenUtil.setHeight(5),
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.location,
                            size: screenUtil.setSp(18),
                          ),
                          SizedBox(
                            width: screenUtil.setWidth(5),
                          ),
                          Text(
                            "$city",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .actionTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenUtil.setHeight(15),
                      ),
                      Text(
                        description.toString(),
                        style: CupertinoTheme.of(context).textTheme.textStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: screenUtil.setWidth(10),
                    vertical: screenUtil.setWidth(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const FoodDrinkPage(),
                              arguments: {
                                'type': 'foods',
                                'id': id,
                                'name': name,
                                'description': description,
                                'pictureId': pictureId,
                                'city': city,
                                'rating': rating,
                                'menus': menus,
                              },
                            );
                          },
                          child: Container(
                            height: screenUtil.setHeight(150),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 3),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  color: CupertinoColors.lightBackgroundGray,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: Image(
                                    width: screenUtil.screenWidth,
                                    height: screenUtil.setHeight(100),
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      pictureId.toString(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenUtil.setHeight(10),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Foods",
                                    style: CupertinoTheme.of(context)
                                        .textTheme
                                        .navTitleTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenUtil.setWidth(10),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const FoodDrinkPage(),
                              arguments: {
                                'type': 'drinks',
                                'id': id,
                                'name': name,
                                'description': description,
                                'pictureId': pictureId,
                                'city': city,
                                'rating': rating,
                                'menus': menus,
                              },
                            );
                          },
                          child: Container(
                            height: screenUtil.setHeight(150),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 3),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  color: CupertinoColors.lightBackgroundGray,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: Image(
                                    width: screenUtil.screenWidth,
                                    height: screenUtil.setHeight(100),
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      pictureId.toString(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenUtil.setHeight(10),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Drinks",
                                    style: CupertinoTheme.of(context)
                                        .textTheme
                                        .navTitleTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   color: Colors.red,
                //   margin: EdgeInsets.symmetric(
                //     horizontal: screenUtil.setWidth(10),
                //     vertical: screenUtil.setWidth(10),
                //   ),
                //   child: Material(
                //     child: ListView.builder(
                //       padding: EdgeInsets.only(
                //         top: screenUtil.setHeight(0),
                //       ),
                //       shrinkWrap: true,
                //       itemCount: menus!.foods!.length,
                //       itemBuilder: (context, index) {
                //         return ListTile(
                //           title: Text(menus!.foods![index].name.toString()),
                //         );
                //       },
                //     ),
                //   ),
                // ),
                // Container(color: Colors.red, height: 150.0),
                // Container(color: Colors.purple, height: 150.0),
                // Container(color: Colors.green, height: 150.0),
              ],
            ),
          ),

          // SliverFixedExtentList(
          //   itemExtent: 150.0,
          //   delegate: SliverChildListDelegate(
          //     [
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             name.toString(),
          //             style: CupertinoTheme.of(context)
          //                 .textTheme
          //                 .navLargeTitleTextStyle,
          //           ),
          //           Text(
          //             city.toString(),
          //             style: CupertinoTheme.of(context)
          //                 .textTheme
          //                 .navTitleTextStyle,
          //           ),
          //           Text(
          //             description.toString(),
          //             style: CupertinoTheme.of(context).textTheme.textStyle,
          //           ),
          //         ],
          //       ),

          //       // Container(color: Colors.red),
          //       // Container(color: Colors.purple),
          //       // Container(color: Colors.green),
          //       // Container(color: Colors.orange),
          //       // Container(color: Colors.yellow),
          //       // Container(color: Colors.pink),
          //     ],
          //   ),
          // ),

          // CupertinoSliverNavigationBar(
          // leading: Material(
          //   child: IconButton(
          //     icon: const Icon(CupertinoIcons.back),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // ),
          // middle: const Text('Kindacode.com'),
          // trailing: Material(
          //   child: IconButton(
          //     icon: const Icon(Icons.add),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // ),
          //   automaticallyImplyTitle: false,
          //   // largeTitle: Text('Search'),

          //   largeTitle: Column(
          //     children: const [
          //       Image(
          //         image: NetworkImage(
          //             "https://restaurant-api.dicoding.dev/images/medium/14"),
          //         fit: BoxFit.cover,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
      // child: Container(
      //   color: CupertinoColors.systemTeal,
      // ),
    );
  }
}
