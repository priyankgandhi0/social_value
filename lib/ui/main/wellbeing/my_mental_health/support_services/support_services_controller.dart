import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../../api/api_extension.dart';
import '../../../../../models/support_service_category.dart';
import '../../../../../models/support_services_model.dart';
import '../../../../../network/wellbing_repo.dart';
import '../../../../../theme/app_helpers.dart';

class SupportServicesController extends GetxController {
  RxBool isLoading = false.obs;
  List<SupportCategoryData> getCategories = [];
  List<HelpLinesModel> getHelplinesList = [];

  getHelplineCategories() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await WellbeingRepo.instance.getHelplineCategories();
    try {
      print("data123${json.decode(result)}");
      var data = supportCategoryDataFromJson(result ?? []);
      getCategories = data;
      print("data----\n ${getCategories[0].title}");
    } catch (e) {
      print(e);
      showAppSnackBar(e.toString());
    }
    isLoading.value = false;
    update();
  }

  getHelplines() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await WellbeingRepo.instance.getHelplines();
    try {
      print("data123${json.decode(result)}");
      var data = supportDataFromJson(result);
      getHelplinesList = data;
      print("data----\n ${getHelplinesList[0].title}");
    } catch (e) {
      print(e);
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }
}
