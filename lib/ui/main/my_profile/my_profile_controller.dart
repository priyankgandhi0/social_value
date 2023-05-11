import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../api/api_extension.dart';
import '../../../constant/shred_preference.dart';
import '../../../network/auth_repo.dart';
import '../../../theme/app_helpers.dart';

class MyProfileController extends GetxController {
  RxBool isObscureText = true.obs;
  RxBool isObscureText1 = true.obs;
  RxBool isObscureText2 = true.obs;
  RxInt tabIndex = 0.obs;
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  String email = preferences.getString(SharedPreference.USER_EMAIL) ?? "";
  String id = preferences.getString(SharedPreference.ACCOUNT_ID) ?? "";
  TextEditingController currentPassCtr = TextEditingController();
  TextEditingController newPassCtr = TextEditingController();
  TextEditingController confirmCtr = TextEditingController();
  TextEditingController nameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();

  changePassword() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await UserStartupRepo.instance
        .changePassword(email: email, password: newPassCtr.text, id: id);
    try {
      showAppSnackBar("Password has been change Successfully");
      newPassCtr.clear();
      currentPassCtr.clear();
      confirmCtr.clear();
    } catch (e) {
      print(e);
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }
}
