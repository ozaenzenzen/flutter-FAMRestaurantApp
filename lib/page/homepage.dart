// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fam_ui7/application/list_restaurant/bloc/list_restaurant_bloc.dart';
import 'package:flutter_fam_ui7/domain/list_restaurant_response.dart';
import 'package:flutter_fam_ui7/widget/list_restaurant_item.dart';
import 'package:flutter_fam_ui7/widget/state_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScreenUtil screenUtil = ScreenUtil();

  ListRestaurantResponse listRestaurantResponse = ListRestaurantResponse();

  TextEditingController searchController = TextEditingController();

  String? tempSearch;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ListRestaurantBloc>(context)
        .add(ListRestaurantShowListEvent());
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
                    searchController.text = search;
                    BlocProvider.of<ListRestaurantBloc>(context)
                        .add(ListRestaurantSearchListEvent(search));
                  },
                  onSuffixTap: () {
                    BlocProvider.of<ListRestaurantBloc>(context)
                        .add(ListRestaurantShowListEvent());
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
                  BlocProvider.of<ListRestaurantBloc>(context).add(
                      ListRestaurantSearchListEvent(searchController.text));
                },
              ),
            ),
          ];
        },
        body: BlocConsumer<ListRestaurantBloc, ListRestaurantState>(
          listener: (context, state) {
            if (state is ListRestaurantLoading) {
              StateWidget.stateWidget.stateLoadingApp();
            } else if (state is ListRestaurantError) {
              showDialog(
                context: context,
                builder: (contextDialog) {
                  return StateWidget.stateWidget
                      .stateDialogErrorApp(errorMessage: state.errorMessage);
                },
              );
            } else if (state is ListRestaurantGetSuccess) {
              listRestaurantResponse = state.listRestaurantResponse;
            }
          },
          builder: (context, state) {
            if (state is ListRestaurantGetSuccess) {
              return listRestaurantPage(
                itemCount: state.listRestaurantResponse.restaurants!.length,
                data: state.listRestaurantResponse,
              );
            } else if (state is ListRestaurantSearchSuccess) {
              return listRestaurantPage(
                itemCount: state.searchRestaurantResponse.restaurants!.length,
                data: state.searchRestaurantResponse,
              );
            } else if (state is ListRestaurantError) {
              return SizedBox(
                height: screenUtil.screenHeight,
                child: Container(
                  alignment: Alignment.center,
                  height: screenUtil.setHeight(40),
                  width: screenUtil.setWidth(40),
                  child: Text(
                    "${state.errorMessage} \n \n Try to click search button again or check your internet connection",
                    textAlign: TextAlign.center,
                    style:
                        CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                  ),
                ),
              );
            }
            return StateWidget.stateWidget.stateLoadingApp();
          },
        ),
      ),
    );
  }

  Widget listRestaurantPage({
    int? itemCount,
    dynamic data,
    // Restaurant data,
  }) {
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
        itemCount: itemCount,
        // itemCount: state.searchRestaurantResponse.restaurants!.length,
        itemBuilder: (context, index) {
          return RestaurantItem(
            id: data!.restaurants![index].id,
            name: data.restaurants![index].name,
            description: data.restaurants![index].description,
            pictureId: data.restaurants![index].pictureId,
            city: data.restaurants![index].city,
            rating: data.restaurants![index].rating,
          );
        },
      ),
    );
  }
}
