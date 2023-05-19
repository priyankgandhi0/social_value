import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:social_value/network/wellbing_repo.dart';
import '../../../../../api/api_extension.dart';
import '../../../../../models/insurance_model.dart';
import '../../../../../theme/app_helpers.dart';

class InsuranceController extends GetxController {
  RxBool isLoading = false.obs;

  List<Insurance> getInsurance = [];

  getInsurances() async {
    getInsurance.clear();
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await WellbeingRepo.instance.getInsurances();
    try {
      log("data123${json.decode(result)}");
      var data = insuranceFromJson(result ?? []);
      getInsurance = data;
      log("data----\n ${getInsurance[0].title}");
    } catch (e) {
      print(e);
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }
}
