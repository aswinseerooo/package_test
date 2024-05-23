

import 'package:mynewpackage/app/authentication/model/create_user_response.dart';

import 'models/service_category_response.dart';


abstract class HomeService {
  Future<ServiceCategoryResponse> getServiceList();


}
