import 'package:get_storage/get_storage.dart';

class AppStorage {
  static const accessToken = "access_token";
  static const refreshToken = "refresh_token";
  static const isLoggedin = "is_logged_in";
  static const setProfile = "set_profile";
  static const skipIntro = "skip_intro";
  static const tokenType = "token_type";
  static const isAuthenticate = "is_authenticate";
  static const userId = "user_id";
  static const userName = "user_name";
  static const childUserId = "child_user_id";
  static const profileId = "profile_id";
  static const switchProfileId = "switch_profile_id";
  static const isFirstTime = "is_first_time";

  AppStorage() {
    GetStorage.init();
  }

  GetStorage storage = GetStorage();

  void writeAccessToken(String value) async {
    await storage.write(AppStorage.accessToken, value);
  }

  String getAccessToken() {
    return storage.read(AppStorage.accessToken) ?? "";
  }

  void writeRefreshToken(String value) async {
    await storage.write(AppStorage.refreshToken, value);
  }

  String getRefreshToken() {
    return storage.read(AppStorage.refreshToken) ?? "";
  }

  void writeSkipIntro(bool value) async {
    await storage.write(AppStorage.skipIntro, value);
  }

  bool readSkipIntro() {
    return storage.read(AppStorage.skipIntro) ?? false;
  }

  void writeIsLoggedIn(bool value) async {
    await storage.write(AppStorage.isLoggedin, value);
  }

  bool isLoggedIn() {
    return storage.read(AppStorage.isLoggedin) ?? false;
  }

  void writeTokenType(String value) async {
    await storage.write(AppStorage.tokenType, value);
  }

  String getTokenType() {
    return storage.read(AppStorage.tokenType) ?? "";
  }

  void clearValues() async {
    await storage.erase();
  }

  void writeUserId(String value) async {
    await storage.write(AppStorage.userId, value);
  }

  String getUserId() {
    return storage.read(AppStorage.userId) ?? "";
  }

  void writeUserEmail(String value) async {
    await storage.write(AppStorage.userName, value);
  }

  String getUserEmail() {
    return storage.read(AppStorage.userName) ?? "";
  }

  void writeChildUserId(String value) async {
    await storage.write(AppStorage.childUserId, value);
  }

  String getChildUserId() {
    return storage.read(AppStorage.childUserId) ?? "";
  }

  void writeIsAuthenticated(bool value) async {
    await storage.write(AppStorage.isAuthenticate, value);
  }

  bool isAuthenticated() {
    return storage.read(AppStorage.isAuthenticate) ?? false;
  }

  void writeSelectedProfileId(String value) async {
    await storage.write(AppStorage.profileId, value);
  }

  String getSelectedProfileId() {
    return storage.read(AppStorage.profileId) ?? "";
  }

  void writeSwitchProfileId(String value) async {
    await storage.write(AppStorage.switchProfileId, value);
  }

  String getSwitchProfileId() {
    return storage.read(AppStorage.switchProfileId) ?? "";
  }

  void writeIsFirstTime(bool value) async {
    await storage.write(AppStorage.isFirstTime, value);
  }

  bool getFirstTime() {
    return storage.read(AppStorage.isFirstTime) ?? false;
  }
}
