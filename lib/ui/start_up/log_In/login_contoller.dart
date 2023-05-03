import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../api/api_extension.dart';
import '../../../constant/shred_preference.dart';
import '../../../models/get_srticle_model.dart';
import '../../../models/user_model.dart';
import '../../../network/auth_repo.dart';
import '../../../theme/app_helpers.dart';
import '../../../utils/routes_manager.dart';

class LogInScreenController extends GetxController {
  RxBool isObscureText = true.obs;
  RxInt tabIndex = 0.obs;
  RxBool isLoading = false.obs;
  final signInKey = GlobalKey<FormState>();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  GetArticle? get;
  String name = preferences.getString(SharedPreference.FIRST_NAME) ?? "";
  userLogin() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;

    dynamic result;
    result = await UserStartupRepo.instance.userSignIn(
      email: emailCtr.text,
      password: passwordCtr.text,
    );
    try {
      print("login data123${result}");
      UserModel user = UserModel.fromJson(json.decode(result));
      preferences.saveUserItem(user);
      preferences.putString(SharedPreference.USER_EMAIL, user.email);
      preferences.putString(SharedPreference.FIRST_NAME, user.firstname);
      preferences.putBool(SharedPreference.IS_LOGGED_IN, true);
      if (user.status == "Success") {
        isLoading.value = false;
        preferences.putBool(SharedPreference.IS_LOGGED_IN, true);
        Get.offAllNamed(Routes.dashboardScreen);
      } else if (user.status == "Failed") {
        isLoading.value = false;
        showAppSnackBar("Account does not exist");
      } else {
        isLoading.value = false;
        showAppSnackBar("Incorrect login details");
      }
    } catch (e) {
      print(e);
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }
}
