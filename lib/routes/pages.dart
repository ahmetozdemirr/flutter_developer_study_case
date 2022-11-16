import 'package:flutter_developer_study_case/bindings/home_page_bindings.dart';
import 'package:flutter_developer_study_case/routes/routes.dart';
import 'package:flutter_developer_study_case/view/home_page.dart';
import 'package:get/get.dart';

class Pages {
  static final pages = [
    GetPage(
        name: RouteConstant.homePage,
        page: () => HomePage(),
        binding: HomePageBindings()),
  ];
}
