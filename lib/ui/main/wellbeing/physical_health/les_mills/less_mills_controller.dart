import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../../api/api_extension.dart';
import '../../../../../models/get_srticle_model.dart';
import '../../../../../models/video_catgory_model.dart';
import '../../../../../network/wellbing_repo.dart';
import '../../../../../theme/app_helpers.dart';

class LessMillsController extends GetxController {
  RxBool isLoading = false.obs;
  List<VideoCategory> videoCategoryList = [];
  List<Map<String, dynamic>> videoId = [];
  getVideoCategories() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await WellbeingRepo.instance.getVideoCategories();
    try {
      print("login data123${result}");
      var data = videoCategoryFromJson(result);
      videoCategoryList = data;
      // print("data----${data[0].title}");
    } catch (e) {
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }
}
