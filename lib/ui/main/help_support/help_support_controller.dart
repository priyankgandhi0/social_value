import 'dart:developer';

import 'package:get/get.dart';
import 'package:social_value/network/faqs_repo.dart';

import '../../../api/api_extension.dart';
import '../../../models/faqs_modal.dart';
import '../../../theme/app_helpers.dart';

class HelpSupportController extends GetxController {
  var visibility = false.obs;
  RxBool isLoading  = false.obs;
  bool webViewOpen = true;
  var index = 0.obs;
  List<FaqSModal>  faqsList = [];


  void changed(bool visibal, String field) {
    if (field == "text") {
      visibility.value = visibal;
    }
    update();
  }


  getFaqsData() async {
    isLoading.value = true;
    dynamic result;
    result  = await FaQsRepo.instance.getFaq();
    try{
      var data = welcomeFromJson(result);
      faqsList = data;
      isLoading.value = false;
      update();
    }catch(e){
      log(e.toString());
      showAppSnackBar(errorText);
    }
  }


  @override
  void onInit() {
    getFaqsData();
    // TODO: implement onInit
    super.onInit();
  }


}
