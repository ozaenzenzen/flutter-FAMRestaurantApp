import 'package:flutter/cupertino.dart';
import 'package:flutter_fam_ui7/page/homepage.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'TestCupertino',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemOrange,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
