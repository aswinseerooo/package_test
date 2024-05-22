import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mynewpackage/model/refresh_token_model.dart';

import '../../services/api_service.dart';
import 'authentication_service.dart';


class AuthRepository implements AuthService {
  ApiService apiService = Get.find();

  @override
  Future<RefreshTokenModel> authenticate(Map<String, dynamic>? params) async {
    RefreshTokenModel authenticationResponse;
    Response response = await apiService.reqst(url: 'auth/auth-refresh', params: params);
    try {
      authenticationResponse = RefreshTokenModel.fromJson(response.body);
      return authenticationResponse;
    } catch (e) {
      return RefreshTokenModel(
          message: "Server Error", status: 401);
    }
  }




}
