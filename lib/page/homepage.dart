// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fam_ui7/domain/list_restaurant_response.dart';
import 'package:flutter_fam_ui7/utils/datajson.dart';
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
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text("Restaurant App"),
      // ),
      // ignore: avoid_unnecessary_containers
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text("Restaurant App"),
              // leading: CupertinoButton(
              //   child: Icon(Icons.add),
              //   onPressed: () {},
              // ),
            ),
          ];
        },
        body: FutureBuilder(
          future: DataJSON().getData(),
          builder: (context, AsyncSnapshot<ListRestaurantResponse> snapshot) {
            if (snapshot.data == null) {
              // ignore: sized_box_for_whitespace
              return Container(
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
                vertical: screenUtil.setHeight(10),
              ),
              child: ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.restaurants!.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          color: CupertinoColors.lightBackgroundGray,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: screenUtil.setWidth(10),
                      vertical: screenUtil.setHeight(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: screenUtil.setWidth(10),
                            vertical: screenUtil.setHeight(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                              width: screenUtil.setWidth(100),
                              image: NetworkImage(
                                snapshot.data!.restaurants![index].pictureId
                                    .toString(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${snapshot.data!.restaurants![index].name}",
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .navTitleTextStyle,
                              ),
                              Row(
                                children: [
                                  Icon(CupertinoIcons.location,
                                      size: screenUtil.setSp(18)),
                                  Text(
                                    "${snapshot.data!.restaurants![index].city}",
                                    style: CupertinoTheme.of(context)
                                        .textTheme
                                        .actionTextStyle,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenUtil.setHeight(10),
                              ),
                              Text(
                                "${snapshot.data!.restaurants![index].rating}",
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .navTitleTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
