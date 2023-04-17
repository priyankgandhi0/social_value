// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';

import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferences = SharedPreference();

class SharedPreference {
  static SharedPreferences? _preferences;

  init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  static const String IS_LOGGED_IN = "isLoggedIn";
  static const String IS_GOOGLE_LOG_IN = "IS_GOOGLE_LOG_IN";
  static const String IS_APPLE_LOG_IN = "IS_APPLE_LOG_IN";
  static const String USER_INFO = "userInfo";
  static const APP_DEVICE_TYPE = "App-Device-Type";
  static const APP_STORE_VERSION = "App-Store-Version";
  static const APP_DEVICE_MODEL = "App-Device-Model";
  static const APP_OS_VERSION = "App-Os-Version";
  static const APP_STORE_BUILD_NUMBER = "App-Store-Build-Number";
  static const AUTH_TOKEN = "Auth-Token";
  static const POST_CODE = "Post-Code";
  static const SHOP_POST_CODE = "Shop-Post-Code";
  static const LIVE_IN_UK = "LiveInUk";
  static const USER_LOCATION = "UserLocation";
  static const USER_TOKEN = "user-Token";
  static const USER_NAME = "user-name";
  static const USER_PROFILE_NAME = "user-name";
  static const USER_EMAIL = "user-email";
  static const USER_PROFILE_IMAGE = "user-image";
  static const USER_PHONE_NUMBER = "phone-number";
  static const USER_ADDRESS = "address";
  static const String IS_DARK_MODE = "skipLogin";
  static const String USER_TYPE = "userType";

  // saveUserItem(UserModel userItem) {
  //   preferences.putBool(IS_LOGGED_IN, true);
  //   preferences.putString(AUTH_TOKEN, userItem.data.authToken);
  //   preferences.putString(USER_TOKEN, userItem.data.userToken);
  //   preferences.putString(USER_EMAIL, userItem.data.email);
  //   preferences.putString(USER_NAME, userItem.data.fullName);
  //   preferences.putString(USER_PROFILE_IMAGE, userItem.data.profileImage);
  //   _preferences!.setString(USER_INFO, jsonEncode(userItem.toJson()));
  // }
  //
  // UserModel? getUserData() {
  //   if (_preferences == null) {
  //     return null;
  //   } else {
  //     String? userPref = _preferences!.getString(USER_INFO);
  //     Map<String, dynamic> userMap =
  //         jsonDecode(userPref!) as Map<String, dynamic>;
  //     UserModel user = UserModel.fromJson(userMap);
  //     return user;
  //   }
  // }

  void clearUserItem() async {
    _preferences?.clear();
    _preferences = null;
    await init();
    putAppDeviceInfo();
  }

  // logOutUser(BuildContext context) {
  //   if (getBool(IS_GOOGLE_LOG_IN) ?? false) {
  //     GoogleSignIn().signOut();
  //   } else if (getBool(IS_APPLE_LOG_IN) ?? false) {}
  //  Get.offAllNamed(Routes.signInScreen);
  //   clearUserItem();
  // }

  void updateUserItem() async {
    _preferences!.reload();
    await init();
    putAppDeviceInfo();
  }

  putAppDeviceInfo() async {
    if (kIsWeb) {
      putString(APP_DEVICE_MODEL, "Test");
      putString(APP_OS_VERSION, "Web 1.0");
      putString(APP_STORE_VERSION, "1.0.0");
      putString(APP_STORE_BUILD_NUMBER, "1.0.0");
      putString(APP_DEVICE_TYPE, "web");
    } else {
      bool isiOS = Platform.isIOS;
      putString(APP_DEVICE_TYPE, isiOS ? "iOS" : "android");
      var deviceInfo = await appDeviceInfo();
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      if (isiOS) {
        IosDeviceInfo iosDeviceInfo = (deviceInfo as IosDeviceInfo);
        putString(APP_DEVICE_MODEL, deviceInfo.model);
        putString(APP_OS_VERSION, "iOS ${iosDeviceInfo.systemVersion}");
      } else {
        AndroidDeviceInfo androidDeviceInfo = (deviceInfo as AndroidDeviceInfo);
        putString(APP_DEVICE_MODEL, androidDeviceInfo.model);
        putString(APP_OS_VERSION, androidDeviceInfo.version.release);
      }
      putString(APP_STORE_VERSION, packageInfo.version);
      putString(APP_STORE_BUILD_NUMBER, packageInfo.buildNumber);
    }
  }

  Future<dynamic> appDeviceInfo() async {
    return Platform.isIOS
        ? await DeviceInfoPlugin().iosInfo
        : await DeviceInfoPlugin().androidInfo;
  }

  Future<bool?> putString(String key, String value) async {
    return _preferences == null ? null : _preferences!.setString(key, value);
  }

  String? getString(String key, {String defValue = ""}) {
    return _preferences == null
        ? defValue
        : _preferences!.getString(key) ?? defValue;
  }

  Future<bool?> putInt(String key, int value) async {
    return _preferences == null ? null : _preferences!.setInt(key, value);
  }

  int? getInt(String key, {int defValue = 0}) {
    return _preferences == null
        ? defValue
        : _preferences!.getInt(key) ?? defValue;
  }

  Future<bool?> putDouble(String key, double value) async {
    return _preferences == null ? null : _preferences!.setDouble(key, value);
  }

  double getDouble(String key, {double defValue = 0.0}) {
    return _preferences == null
        ? defValue
        : _preferences!.getDouble(key) ?? defValue;
  }

  Future<bool?> putBool(String key, bool value) async {
    return _preferences == null ? null : _preferences!.setBool(key, value);
  }

  bool? getBool(String key, {bool defValue = false}) {
    return _preferences == null
        ? defValue
        : _preferences!.getBool(key) ?? defValue;
  }
}
