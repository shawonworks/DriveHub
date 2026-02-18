import 'package:get_storage/get_storage.dart';

class StorageKey {
  // StorageKey._();
  // static const String token = "token";
  // static const String refreshToken = "refreshToken";
  // static const String onBoardValue = "onBoard";
  // static const String likeValue = "likeValue";
  // static const String dislikeValue = "dislkeValue";
  static const String loginValue = "loginValue";
  static const String setLoginUserRole = "setLoginUserRole";
  static const String setEmail = "email";
  static const String starting = "starting";
  static const String role = "role";
}

class AppStorage {
  ////////////// storage initial
  GetStorage box = GetStorage();



  //////////////////// Token
  // Future<void> setToken(String value) async {
  //   await box.write(StorageKey.token, value);
  // }

  // String? getToken() {
  //   return box.read(StorageKey.token) ?? "";
  // }

  // Future<void> setRefreshToken(String value) async {
  //   await box.write(StorageKey.refreshToken, value);
  // }

  Future<void> setLoginValue(bool value) async {
    await box.write(StorageKey.loginValue, value);
  }

  Future<void> setRole(String value) async {
    await box.write(StorageKey.role, value);
  }

  String? getRole() {
    return box.read(StorageKey.role);
  }

  String getAllValues() {
    return box.read(StorageKey.role);
  }

  bool getLoginValue() {
    return box.read(StorageKey.loginValue) ?? false;
  }

  Future<void> setEmailID(String value) async {
    await box.write(StorageKey.setEmail, value);
  }

  bool getLoginUserRole() {
    return box.read(StorageKey.setLoginUserRole) ?? false;
  }

  String getEmailID() {
    return box.read(StorageKey.setEmail) ?? 'No Email ID Inserted';
  }

  void setStartingScreen(bool value) {
    box.write(StorageKey.starting, value);
  }

  bool getStartingScreen() {
    return box.read(StorageKey.starting) ?? false;
  }
  // String? getRefreshToken() {
  //   return box.read(StorageKey.refreshToken);
  // }

  // Future<void> setOnBoardValue(String value) async {
  //   await box.write(StorageKey.onBoardValue, value);
  // }

  // Future<void> setLikeValue(String value) async {
  //   await box.write(StorageKey.likeValue, value);
  // }

  // Future<void> setDislikeValue(String value) async {
  //   await box.write(StorageKey.dislikeValue, value);
  // }

  String? getValue(String value) {
    return box.read(value);
  }

  // Future<void> removeValue(String value) async {
  //   await box.remove(value);
  // }

  // ///logout
  // Future<void> storageAllClear() async {
  //   await box.erase();
  // }
}
