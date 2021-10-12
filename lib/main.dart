import 'package:flutter/material.dart';
import 'package:flutter_fam_ui7/app_widget.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
