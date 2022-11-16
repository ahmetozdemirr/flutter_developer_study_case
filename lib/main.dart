import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_developer_study_case/routes/pages.dart';
import 'package:flutter_developer_study_case/routes/routes.dart';
import 'package:flutter_developer_study_case/view/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        // visualDensity: VisualDensity.adaptivePlatformDensity,
        // brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleSpacing: 00.0,
          toolbarHeight: 60.2,
          //
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0,

          scrolledUnderElevation: 0,

          //backgroundColor: Colors.red,

          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
        ),
      ),
      getPages: Pages.pages,
      initialRoute: RouteConstant.homePage,
    );
  }
}
