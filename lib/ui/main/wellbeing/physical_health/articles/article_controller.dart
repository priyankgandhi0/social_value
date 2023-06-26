import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:social_value/network/wellbing_repo.dart';
import '../../../../../api/api_extension.dart';
import '../../../../../models/article_list_model.dart';
import '../../../../../models/article_model.dart';
import '../../../../../theme/app_helpers.dart';

class ArticleController extends GetxController {
  RxBool isLoading = false.obs;
  List<ArticleList> articlesList = [];
  List<ArticleList> planetArticleList = [];
  List<GetArticle> articleCategoryList = [];
  List<GetArticle> articleCategoryItem = [];
  bool _isOpen = false;
  bool get isOpen => _isOpen;

  set isOpen(bool value) {
    _isOpen = value;
    update();
  }

  String articleType = "All";
  getArticleCategories() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await WellbeingRepo.instance.getArticleCategories();
    try {
      print("login data123${result}");
      var data = getArticleFromJson(result);
      articleCategoryList = data;
      for (var element in articleCategoryList) {
        if (element.parentCategoryId == "28") {
          articleCategoryItem.add(element);
          update();
        }
      }
      // print("data----${data[0].title}");
    } catch (e) {
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }

  getArticles(String ids) async {
    // articlesList.clear();
    // planetArticleList.clear();
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await WellbeingRepo.instance.getArticles(ids: ids);
    try {
      // print("data123${json.decode(result)}");
      var data = articleListFromJson(result ?? []);
      if (ids == "11") {
        planetArticleList = data;
        update();
      } else {
        articlesList = data;
        articlesList.forEach((element) {
          print("Image ----> ${element.featuredImage}");
        });
        print("Data Meal Plan  ----> ${result}");
        update();
      }
    } catch (e) {
      print(e);
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }
}
