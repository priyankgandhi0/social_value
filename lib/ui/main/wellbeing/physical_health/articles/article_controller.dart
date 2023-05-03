import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:social_value/network/wellbing_repo.dart';

import '../../../../../api/api_extension.dart';
import '../../../../../models/article_list_model.dart';
import '../../../../../models/get_srticle_model.dart';

import '../../../../../theme/app_helpers.dart';

class ArticleController extends GetxController {
  RxBool isLoading = false.obs;
  List<ArticleList> articlesList = [];
  @override
  void dispose() {
    articlesList.clear();
    super.dispose();
  }

  getArticleCategories() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await WellbeingRepo.instance.getArticleCategories();
    try {
      print("login data123${result}");
      var data = getArticleFromJson(result);
      print("data----${data[0].title}");
    } catch (e) {
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }

  getArticles(String ids) async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await WellbeingRepo.instance.getArticles(ids: ids);
    try {
      print("data123${json.decode(result)}");
      var data = articleListFromJson(result);
      articlesList = data;
      print("data----${articlesList[0].title}");
    } catch (e) {
      print(e);
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }
}
