import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../../api/api_extension.dart';
import '../../../../../models/catgory_model.dart';
import '../../../../../network/wellbing_repo.dart';
import '../../../../../theme/app_helpers.dart';

class LessMillsController extends GetxController {
  RxBool isLoading = false.obs;
  List<CategoryList> videoCategoryList = [];
  List<CategoryList> videoCategoryItem = [];

  getVideoCategories() async {
    if (videoCategoryItem.isNotEmpty) return;
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await WellbeingRepo.instance.getVideoCategories();
    try {
      print("login data123${result}");
      var data = videoCategoryFromJson(result);
      videoCategoryList = data;
      for (var element in videoCategoryList) {
        if (element.parentCategoryId == "72") {
          videoCategoryItem.add(element);
          update();
        }
      }
    } catch (e) {
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }
}
