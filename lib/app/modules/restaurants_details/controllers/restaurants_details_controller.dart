import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynewpackage/app/modules/restaurants_details/data/models/get_restaurant_details_response.dart';
import 'package:mynewpackage/app/modules/restaurants_details/data/restaurant_details_repository.dart';

class RestaurantsDetailsController extends GetxController {
  RxBool isLoading = false.obs;
  int page = 1;
  int limit = 1;
  RxBool isLoadingMore = false.obs;
  bool haveRestaurantDetails = false;

  RestaurantDetailsRepository restaurantDetailsRepository =
      Get.put(RestaurantDetailsRepository());
  RxList<Restaurant> restaurantDetails =
      List<Restaurant>.empty(growable: true).obs;

  Future<bool> getRestaurantdetails(
      {required String restaurantId, required bool initial}) async {
    if (initial) {
      page = 1;
      limit = 10;
      isLoading(true);
      restaurantDetails.clear();
    }

    await restaurantDetailsRepository
        .getRestaurantDetails(restaurantId, page, limit)
        .then((value) {
      if ((value.data != null) && (value.status == 200)) {
        if (initial) {
          restaurantDetails.value = value.data?.restaurant ?? [];
          isLoading(false);
        } else {
          restaurantDetails.addAll(value.data?.restaurant ?? []);
        }
        if ((value.data?.restaurant ?? []).isNotEmpty) {
          isLoadingMore.value = false;
          haveRestaurantDetails = true;
        } else {
          haveRestaurantDetails = false;
          isLoadingMore.value = false;
        }
        restaurantDetails.addAll(value.data?.restaurant ?? []);
        isLoading(false);
        return true;
      } else {
        isLoading(false);
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          content: Text(
            value.message.toString(),
          ),
          backgroundColor: Colors.red,
        ));
        return false;
      }
    });
    return false;
  }

  bool onScrollOngoing(ScrollNotification scrollInfo,
      {required String restaurantId}) {
    if (!isLoadingMore.value &&
        scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
        haveRestaurantDetails) {
      page = page + 1;
      if (haveRestaurantDetails) {
        isLoadingMore.value = true;
        getRestaurantdetails(restaurantId: restaurantId, initial: false);
      } else {
        isLoadingMore.value = false;
      }
    }
    return false;
  }
}
