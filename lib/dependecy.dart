import 'package:get/get.dart';
import 'package:mynewpackage/services/api_service.dart';
import 'package:mynewpackage/storage/storage.dart';

import 'app/authentication/authentication_repo.dart';
import 'app/authentication/authentication_service.dart';

class DependencyCreator {
  static init() {


    Get.lazyPut<AuthService>(() => AuthRepository(), fenix: true);
    Get.lazyPut<ApiService>(() => ApiService(baseUrl: ""), fenix: true);
    Get.lazyPut<AppStorage>(() => AppStorage(), fenix: true);

  }
}
