

import 'package:mynewpackage/model/refresh_token_model.dart';

abstract class AuthService {
  Future<RefreshTokenModel> authenticate(Map<String, dynamic>? params);


}
