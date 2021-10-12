import 'package:flutter/cupertino.dart';
import 'package:flutter_fam_ui7/page/restaurant_detail.dart';
import 'package:flutter_fam_ui7/urls/urls.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RestaurantItem extends StatefulWidget {
  final String? id;
  final String? name;
  final String? description;
  final String? pictureId;
  final String? city;
  final double? rating;

  // ignore: use_key_in_widget_constructors
  const RestaurantItem({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  @override
  _RestaurantItemState createState() => _RestaurantItemState();
}

class _RestaurantItemState extends State<RestaurantItem> {
  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => const RestaurantDetail(),
          arguments: {
            'id': widget.id,
            'name': widget.name,
            'description': widget.description,
            'pictureId': widget.pictureId,
            'city': widget.city,
            'rating': widget.rating,
          },
        );
      },
      child: Container(
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
                      Urls.IMAGE_SMALL + "/${widget.pictureId.toString()}"),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${widget.name}",
                    style:
                        CupertinoTheme.of(context).textTheme.navTitleTextStyle,
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
                        "${widget.city}",
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .actionTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(10),
                  ),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.star_fill,
                        size: screenUtil.setSp(15),
                      ),
                      SizedBox(
                        width: screenUtil.setWidth(5),
                      ),
                      Text(
                        "${widget.rating}",
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navTitleTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
