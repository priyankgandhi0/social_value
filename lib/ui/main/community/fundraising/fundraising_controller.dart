import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../api/api_extension.dart';
import '../../../../../theme/app_helpers.dart';
import '../../../../models/fundraising_model.dart';
import '../../../../network/community_repo.dart';

class FundraisingController extends GetxController {
  RxBool isLoading = false.obs;
  List<Fundraising> getFundraising = [];

  getFundraisingIdeas() async {
    getFundraising.clear();
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await CommunityRepo.instance.getFundraisingIdeas();
    try {
      var data = fundraisingFromJson(result ?? []);
      getFundraising = data;
    } catch (e) {
      print(e);
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }
}
