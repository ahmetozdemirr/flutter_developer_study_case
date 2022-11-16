import 'package:flutter_developer_study_case/controller/home_page_controller.dart';
import 'package:get/get.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
