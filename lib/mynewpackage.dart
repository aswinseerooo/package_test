library mynewpackage;


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynewpackage/app/authentication/authentication_repo.dart';
import 'package:mynewpackage/app/modules/home/views/home_view.dart';
import 'package:mynewpackage/app/modules/restaurants_and_dishes_listing/views/restaurants_and_dishes_listing_view.dart';
import 'package:mynewpackage/app/routes/app_pages.dart';
import 'package:mynewpackage/services/api_service.dart';

import 'app/authentication/authentication_service.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'app/modules/restaurants_and_dishes_listing/controllers/restaurants_and_dishes_listing_controller.dart';
import 'dependecy.dart';

export 'package:mynewpackage/app/routes/app_pages.dart';


class MyPackage extends StatefulWidget {
  final String? route;
  final String clientId;
  final String clientSecrete;
  const MyPackage({super.key,  this.route,required this.clientId,required this.clientSecrete});

  @override
  State<MyPackage> createState() => _MyPackageState();
}

class _MyPackageState extends State<MyPackage> {

  HomeController homeController = HomeController();

  @override
  void initState() {


    homeController.clientId = widget.clientId;
    homeController.clientSecrete = widget.clientSecrete;



    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut(()=>RestaurantsAndDishesListingController());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return switch(widget.route){
      Routes.RESTAURANTS_AND_DISHES_LISTING => RestaurantsAndDishesListingView(),
      _ => const HomeView(),
    };


      }

  }

