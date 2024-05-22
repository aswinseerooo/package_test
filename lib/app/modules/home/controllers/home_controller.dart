import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynewpackage/app/authentication/authentication_repo.dart';
import 'package:mynewpackage/app/authentication/authentication_service.dart';
import 'package:mynewpackage/app/authentication/model/authentication_request_model.dart';
import 'package:mynewpackage/app/modules/home/views/home_view.dart';
import 'package:mynewpackage/storage/storage.dart';

import '../../../../app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../../widgets/common_Image_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  List gridItemsName = [
    "Food",
    "Cabs",
    "Salon Services",
    "Home Services",
    "Gifts",
    "Furniture",
    "Courier",
    "Grocery",
    "Others"
  ];
  List imagesItem = [
    Assets.iconsFood,
    Assets.iconsCab,
    Assets.iconsSalonService,
    Assets.iconsHomeService,
    Assets.iconsGifts,
    Assets.iconsFurniture,
    Assets.iconsCourier,
    Assets.iconsGrocery,
    Assets.iconsOthers
  ];
  List addressTypeImage = [Assets.iconsHomeIcon, Assets.iconsOffice];
  List addressHeading = ["Home", "Office"];
  List addressDescription = [
    "67/8, 4th cross Road, Lavella Road,  Bengaluru,Karnataka 560001, India",
    "No. 63, 1st Floor, 14th Cross, 9th Main Road,Indiranagar, Bengaluru, Karnataka 560038, India"
  ];
  RxString address = ''.obs;
  RxBool isLoading = false.obs;
  AppStorage storage = AppStorage();
  AuthRepository authRepository = Get.put(AuthRepository());
  String clientId = "";
  String clientSecrete = "";



  @override
  void onInit() {
    authenticate();
    debugPrint("hi");
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showAddressSelectionBottomSheet(context: Get.context!);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void showAddressSelectionBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Your Delivery Location',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.add_circle_outline, color: AppColors.primaryColor,),
                  const SizedBox(width: 10,),
                  Text("Add New Address",
                    style: TextStyle(color: AppColors.primaryColor),),

                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Saved Address',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: addressTypeImage.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          address.value = addressDescription[index];
                          debugPrint("value ${address.value}");
                          Get.back();
                        },
                        child: Container(
                          color: AppColors.backgroundColor,
                          child: ListTile(
                            leading: CommonImageView(
                              svgPath: "packages/mynewpackage/${addressTypeImage[index]}",),
                            title: Text(addressHeading[index],
                              style: const TextStyle(fontSize: 16),),
                            subtitle: Text(addressDescription[index],
                              style: (TextStyle(color: AppColors.textColor)),),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        );
      },
    );
  }

  void authenticate() async {
    debugPrint("inside");
    isLoading(true);

    AuthenticationRequestModel requestModel = AuthenticationRequestModel(
        clientId:clientId, clientSecrete:clientSecrete
    );

    authRepository.authenticate(requestModel.toJson()).then((value) {
      debugPrint("authenticated");
      if (value.status == 200) {
        debugPrint("authenticated");
        storage.writeAccessToken(value.data?.accessToken ?? "");
        storage.writeRefreshToken(value.data?.refreshToken ?? "");
      } else {
        debugPrint("false");
        isLoading(false);
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(content: Text(value.message ?? "")));
      }
    });
  }

}
