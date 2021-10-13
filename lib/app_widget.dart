import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  Future<void> initConnectivity() async {
    late ConnectivityResult result;

    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

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
