// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fam_ui7/application/list_restaurant/bloc/list_restaurant_bloc.dart';
// import 'package:flutter_fam_ui7/application/list_restaurant/cubit/list_restaurant_cubit.dart';
import 'package:flutter_fam_ui7/domain/list_restaurant_response.dart';
import 'package:flutter_fam_ui7/utils/datajson.dart';
import 'package:flutter_fam_ui7/widget/list_restaurant_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScreenUtil screenUtil = ScreenUtil();

  ListRestaurantResponse listRestaurantResponse = ListRestaurantResponse();

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // BlocProvider.of<ListRestaurantCubit>(context).getListDataRestaurant();
    BlocProvider.of<ListRestaurantBloc>(context).add(ListRestaurantShowListEvent());
    super.initState();
  }

  String? tempSearch;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: const Text("Restaurant App"),
              middle: Container(
                padding: EdgeInsets.only(
                  top: screenUtil.setHeight(5),
                ),
                child: CupertinoSearchTextField(
                  controller: searchController,
                  prefixIcon: Container(),
                  onSubmitted: (String search) {
                    // FocusScope.of(context).unfocus();
                    // context.read<ListRestaurantBloc>().add(ListRestaurantSearchListEvent(search));

                    //

                    searchController.text = search;

                    BlocProvider.of<ListRestaurantBloc>(context).add(ListRestaurantSearchListEvent(search));
                    // BlocProvider.of<ListRestaurantCubit>(context).searchListDataRestaurant(search);
                  },
                  onSuffixTap: () {
                    // BlocProvider.of<ListRestaurantCubit>(context).getListDataRestaurant();
                    BlocProvider.of<ListRestaurantBloc>(context).add(ListRestaurantShowListEvent());
                    searchController.clear();
                  },
                ),
              ),
              trailing: CupertinoButton(
                child: const Icon(
                  CupertinoIcons.search,
                  color: CupertinoColors.systemBlue,
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  // BlocProvider.of<ListRestaurantCubit>(context).searchListDataRestaurant(searchController.text);
                  BlocProvider.of<ListRestaurantBloc>(context).add(ListRestaurantSearchListEvent(searchController.text));
                },
              ),
            ),
          ];
        },
        // body: BlocProvider(
        //   create: (context) => ListRestaurantBloc()..add(ListRestaurantShowListEvent()),
        // body: BlocProvider<ListRestaurantCubit>(
        //   create: (context) => ListRestaurantCubit()..getListDataRestaurant(),
        body: BlocConsumer<ListRestaurantBloc, ListRestaurantState>(
        // body: BlocConsumer<ListRestaurantCubit, ListRestaurantState>(
          // child: BlocConsumer<ListRestaurantBloc, ListRestaurantState>(
          listener: (context, state) {
            if (state is ListRestaurantLoading) {
              SizedBox(
                height: screenUtil.screenHeight,
                child: Container(
                  alignment: Alignment.center,
                  height: screenUtil.setHeight(40),
                  width: screenUtil.setWidth(40),
                  child: const CircularProgressIndicator(),
                ),
              );
            } else if (state is ListRestaurantError) {
              showDialog(
                context: context,
                builder: (contextDialog) {
                  return CupertinoAlertDialog(
                    title: const Text("Error"),
                    content: Text(state.errorMessage),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            } else if (state is ListRestaurantGetSuccess) {
              listRestaurantResponse = state.listRestaurantResponse;
            } else if (state is ListRestaurantSuccess) {
              //
            } else if (state is ListRestaurantSearchSuccess) {
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: screenUtil.setWidth(10),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    top: screenUtil.setHeight(0),
                  ),
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.searchRestaurantResponse.restaurants!.length,
                  itemBuilder: (context, index) {
                    return RestaurantItem(
                      id: state.searchRestaurantResponse.restaurants![index].id,
                      name: state
                          .searchRestaurantResponse.restaurants![index].name,
                      description: state.searchRestaurantResponse
                          .restaurants![index].description,
                      pictureId: state.searchRestaurantResponse
                          .restaurants![index].pictureId,
                      city: state
                          .searchRestaurantResponse.restaurants![index].city,
                      rating: state
                          .searchRestaurantResponse.restaurants![index].rating,
                    );
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            print("State rightnow: $state");

            if (state is ListRestaurantGetSuccess) {
              // return FutureBuilder(
              //   future: DataJSON().getData(),
              //   builder: (context, AsyncSnapshot<ListRestaurantResponse> snapshot) {
              //     if (snapshot.data == null) {
              //       return SizedBox(
              //         height: screenUtil.screenHeight,
              //         child: SizedBox(
              //           height: screenUtil.setHeight(40),
              //           width: screenUtil.setWidth(40),
              //           child: const CircularProgressIndicator(),
              //         ),
              //       );
              //     }

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
                  itemCount: listRestaurantResponse.restaurants!.length,
                  itemBuilder: (context, index) {
                    return RestaurantItem(
                      id: listRestaurantResponse.restaurants![index].id,
                      name: listRestaurantResponse.restaurants![index].name,
                      description: listRestaurantResponse
                          .restaurants![index].description,
                      pictureId:
                          listRestaurantResponse.restaurants![index].pictureId,
                      city: listRestaurantResponse.restaurants![index].city,
                      rating: listRestaurantResponse.restaurants![index].rating,

                      //

                      // id: snapshot.data!.restaurants![index].id,
                      // name: snapshot.data!.restaurants![index].name,
                      // description: snapshot.data!.restaurants![index].description,
                      // pictureId: snapshot.data!.restaurants![index].pictureId,
                      // city: snapshot.data!.restaurants![index].city,
                      // rating: snapshot.data!.restaurants![index].rating,
                      // menus: snapshot.data!.restaurants![index].menus,
                    );
                  },
                ),
              );
            } else if (state is ListRestaurantError) {
              return Container(
                alignment: Alignment.center,
                height: screenUtil.screenHeight,
                child: Text(
                  "Data error",
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                ),
              );
            } else if (state is ListRestaurantSearchSuccess) {
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
                  itemCount: state.searchRestaurantResponse.restaurants!.length,
                  itemBuilder: (context, index) {
                    return RestaurantItem(
                      id: state.searchRestaurantResponse.restaurants![index].id,
                      name: state
                          .searchRestaurantResponse.restaurants![index].name,
                      description: state.searchRestaurantResponse
                          .restaurants![index].description,
                      pictureId: state.searchRestaurantResponse
                          .restaurants![index].pictureId,
                      city: state
                          .searchRestaurantResponse.restaurants![index].city,
                      rating: state
                          .searchRestaurantResponse.restaurants![index].rating,
                    );
                  },
                ),
              );
            }
            // context.read<ListRestaurantBloc>().add(ListRestaurantShowListEvent());
            return SizedBox(
              height: screenUtil.screenHeight,
              child: Container(
                alignment: Alignment.center,
                height: screenUtil.setHeight(40),
                width: screenUtil.setWidth(40),
                child: const CircularProgressIndicator(),
              ),
            );

            //   },
            // );
          },
        ),
      ),
    );
  }
}
