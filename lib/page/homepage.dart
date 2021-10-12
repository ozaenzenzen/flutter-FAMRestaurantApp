// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fam_ui7/domain/list_restaurant_response.dart';
import 'package:flutter_fam_ui7/utils/datajson.dart';
import 'package:flutter_fam_ui7/widget/list_restaurant_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text("Restaurant App"),
            ),
          ];
        },
        body: FutureBuilder(
          future: DataJSON().getData(),
          builder: (context, AsyncSnapshot<ListRestaurantResponse> snapshot) {
            if (snapshot.data == null) {
              return SizedBox(
                height: screenUtil.screenHeight,
                child: SizedBox(
                  height: screenUtil.setHeight(40),
                  width: screenUtil.setWidth(40),
                  child: const CircularProgressIndicator(),
                ),
              );
            }
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: screenUtil.setWidth(10),
              ),
              child: ListView.builder(
                padding: EdgeInsets.only(
                  top: screenUtil.setHeight(0),
                ),
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.restaurants!.length,
                itemBuilder: (context, index) {
                  return RestaurantItem(
                    id: snapshot.data!.restaurants![index].id,
                    name: snapshot.data!.restaurants![index].name,
                    description: snapshot.data!.restaurants![index].description,
                    pictureId: snapshot.data!.restaurants![index].pictureId,
                    city: snapshot.data!.restaurants![index].city,
                    rating: snapshot.data!.restaurants![index].rating,
                    menus: snapshot.data!.restaurants![index].menus,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
