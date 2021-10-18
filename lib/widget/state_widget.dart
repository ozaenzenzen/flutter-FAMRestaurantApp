import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StateWidget {
  StateWidget._();

  static final StateWidget stateWidget = StateWidget._();

  ScreenUtil screenUtil = ScreenUtil();

  Widget stateLoadingApp() {
    return SizedBox(
      height: screenUtil.screenHeight,
      width: screenUtil.screenWidth,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          height: screenUtil.setHeight(40),
          width: screenUtil.setWidth(40),
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget stateDialogErrorApp({String? errorMessage}) {
    return CupertinoAlertDialog(
      title: const Text("Error"),
      content: Text(errorMessage!),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("OK"),
        ),
      ],
    );
  }

  Widget statePageErrorApp({String? errorMessage, BuildContext? context}) {
    return SizedBox(
      height: screenUtil.screenHeight,
      width: screenUtil.screenWidth,
      child: Container(
        alignment: Alignment.center,
        height: screenUtil.setHeight(40),
        width: screenUtil.setWidth(40),
        child: Text(
          "$errorMessage",
          textAlign: TextAlign.center,
          style: CupertinoTheme.of(context!).textTheme.navTitleTextStyle,
        ),
      ),
    );
  }
}
