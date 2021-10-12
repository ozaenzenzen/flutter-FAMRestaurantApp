import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fam_ui7/page/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // builder: () => const MaterialApp(
      // builder: () => const CupertinoApp(
      builder: () => const GetMaterialApp(
      // builder: () => const GetCupertinoApp(
        title: 'Restaurant App',
        // theme: CupertinoThemeData(
        //   primaryColor: CupertinoColors.systemOrange,
        // ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
      ),
    );
  }
}
