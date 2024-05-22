import 'package:get/get.dart';

import '../../restaurants_and_dishes_listing/controllers/restaurants_and_dishes_listing_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

  }
}
