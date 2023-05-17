import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../api/api_extension.dart';
import '../../../../models/article_list_model.dart';
import '../../../../network/wellbing_repo.dart';
import '../../../../theme/app_helpers.dart';

class ArticleDetailController extends GetxController {
  RxBool isLoading = false.obs;
  List<ArticleList> singleArticle = [];
  getSingleArticle(String id) async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await WellbeingRepo.instance.getSingleArticle(id: id);
    try {
      print("data123${json.decode(result)}");
      var data = articleListFromJson(result);
      singleArticle = data;
    } catch (e) {
      print(e);
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }
}
