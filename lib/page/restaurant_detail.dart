import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fam_ui7/application/detail_restaurant/bloc/detail_restaurant_bloc.dart';
import 'package:flutter_fam_ui7/domain/detail_restaurant_response.dart';
import 'package:flutter_fam_ui7/page/fooddrink_detail.dart';
import 'package:flutter_fam_ui7/urls/urls.dart';
import 'package:flutter_fam_ui7/widget/state_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RestaurantDetail extends StatefulWidget {
  const RestaurantDetail({Key? key}) : super(key: key);

  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  DetailRestaurantResponse detailRestaurantResponse =
      DetailRestaurantResponse();

  ScreenUtil screenUtil = ScreenUtil();

  var data = Get.arguments;

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

  Restaurant? dataDetail;

  @override
  Widget build(BuildContext context) {
    id = data['id'];
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
      ),
      child: BlocProvider(
        create: (context) => DetailRestaurantBloc()
          ..add(DetailRestaurantShowDetailsEvent(id.toString())),
        child: BlocConsumer<DetailRestaurantBloc, DetailRestaurantState>(
          listener: (context, state) {
            if (state is DetailRestaurantLoading) {
              StateWidget.stateWidget.stateLoadingApp();
            } else if (state is DetailRestaurantError) {
              showDialog(
                context: context,
                builder: (contextDialog) {
                  return StateWidget.stateWidget
                      .stateDialogErrorApp(errorMessage: state.errorMessage);
                },
              );
            } else if (state is DetailRestaurantGetSuccess) {
              detailRestaurantResponse = state.detailRestaurantResponse;
              dataDetail = Restaurant(
                id: detailRestaurantResponse.restaurant!.id,
                name: detailRestaurantResponse.restaurant!.name,
                description: detailRestaurantResponse.restaurant!.description,
                city: detailRestaurantResponse.restaurant!.city,
                address: detailRestaurantResponse.restaurant!.address,
                pictureId: detailRestaurantResponse.restaurant!.pictureId,
                categories: detailRestaurantResponse.restaurant!.categories,
                menus: detailRestaurantResponse.restaurant!.menus,
                rating: detailRestaurantResponse.restaurant!.rating,
                customerReviews:
                    detailRestaurantResponse.restaurant!.customerReviews,
              );
            }
          },
          builder: (context, state) {
            if (state is DetailRestaurantGetSuccess) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    centerTitle: true,
                    leading: Container(),
                    backgroundColor: Colors.transparent,
                    expandedHeight: 200.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        Urls.IMAGE_MEDIUM +
                            "/${dataDetail!.pictureId.toString()}",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      dataDetail!.name.toString(),
                                      style: CupertinoTheme.of(context)
                                          .textTheme
                                          .navLargeTitleTextStyle,
                                    ),
                                  ),
                                  CupertinoButton(
                                    child: const Text("Review"),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (contextDialogs) {
                                          return reviewAlertDialog(dataDetail: dataDetail);
                                        },
                                      );
                                    },
                                  ),
                                ],
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
                                  Expanded(
                                    child: Text(
                                      "${dataDetail!.address}, ${dataDetail!.city}",
                                      style: CupertinoTheme.of(context)
                                          .textTheme
                                          .actionTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenUtil.setHeight(5),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.star_fill,
                                    color: CupertinoColors.systemYellow,
                                    size: screenUtil.setSp(18),
                                  ),
                                  SizedBox(
                                    width: screenUtil.setWidth(5),
                                  ),
                                  Text(
                                    "${dataDetail!.rating}",
                                    style: CupertinoTheme.of(context)
                                        .textTheme
                                        .navTitleTextStyle,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenUtil.setHeight(15),
                              ),
                              Text(
                                dataDetail!.description.toString(),
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .textStyle,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: screenUtil.setWidth(10),
                            vertical: screenUtil.setWidth(10),
                          ),
                          child: Text(
                            "Foods and Drinks",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .navTitleTextStyle,
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
                              foodDrinkContainerPage(
                                type: "foods",
                                restaurantData: dataDetail,
                              ),
                              SizedBox(
                                width: screenUtil.setWidth(10),
                              ),
                              foodDrinkContainerPage(
                                type: "drinks",
                                restaurantData: dataDetail,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is DetailRestaurantError) {
              return StateWidget.stateWidget.statePageErrorApp(
                errorMessage:
                    "${state.errorMessage} \n \n Try to click search button again or check your internet connection",
                context: context,
              );
            }
            return StateWidget.stateWidget.stateLoadingApp();
          },
        ),
      ),
    );
  }

  Widget reviewAlertDialog({
    Restaurant? dataDetail,
  }) {
    return CupertinoAlertDialog(
      title: const Text("Review"),
      // content: Expanded(
      content: SizedBox(
        height: screenUtil.setHeight(200),
        width: screenUtil.setWidth(200),
        child: Material(
          color: Colors.transparent,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: dataDetail!.customerReviews!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Review ${index + 1}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dataDetail.customerReviews![index].name.toString()),
                    Text(dataDetail.customerReviews![index].date.toString()),
                    Text(dataDetail.customerReviews![index].review.toString()),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      actions: [
        CupertinoButton(
          child: const Text("OK"),
          onPressed: () {
            Get.back();
          },
        )
      ],
    );
  }

  Widget foodDrinkContainerPage({
    String? type,
    Restaurant? restaurantData,
  }) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => const FoodDrinkPage(),
            arguments: {
              'type': type,
              'id': restaurantData!.id,
              'name': restaurantData.name,
              'description': restaurantData.description,
              'city': restaurantData.city,
              'address': restaurantData.address,
              'pictureId': restaurantData.pictureId,
              'categories': restaurantData.categories,
              'menus': restaurantData.menus,
              'rating': restaurantData.rating,
              'customerReviews': restaurantData.customerReviews,
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
                    Urls.IMAGE_MEDIUM +
                        "/${restaurantData!.pictureId.toString()}",
                  ),
                ),
              ),
              SizedBox(
                height: screenUtil.setHeight(10),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  type.toString(),
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
