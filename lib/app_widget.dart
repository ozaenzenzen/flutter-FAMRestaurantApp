import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fam_ui7/application/detail_restaurant/bloc/detail_restaurant_bloc.dart';
import 'package:flutter_fam_ui7/application/list_restaurant/bloc/list_restaurant_bloc.dart';
import 'package:flutter_fam_ui7/page/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as transition;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ListRestaurantBloc(),
        ),
        BlocProvider(
          create: (context) => DetailRestaurantBloc(),
        ),
      ],
      child: ScreenUtilInit(
        builder: () => const GetMaterialApp(
          title: 'Restaurant App',
          home: HomePage(),
          debugShowCheckedModeBanner: false,
          defaultTransition: transition.Transition.cupertino,
        ),
      ),
    );
  }
}
