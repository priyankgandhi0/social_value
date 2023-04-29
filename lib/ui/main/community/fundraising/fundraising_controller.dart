import 'dart:convert';
import 'package:collection/collection.dart';
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
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await CommunityRepo.instance.getFundraisingIdeas();
    try {
      print("data123${json.decode(result)}");
      var data = fundraisingFromJson(result);
      getFundraising = data;
      // Map<String, List<Fundraising>> grupPerson() {
      //   Map<String, List<Fundraising>> tempMap = {};
      //   for (var i = 0; i < listAlphabet.length; i++) {
      //     final result = Fundraising.where((Fundraising) => Fundraising.title
      //         .toLowerCase()
      //         .startsWith(listAlphabet[i].name)).toList();
      //     for (var j = 0; j < result.length; j++) {
      //       final original = tempMap[listAlphabet[i].name];
      //       if (original == null) {
      //         tempMap[listAlphabet[i].name] = [result[j]];
      //       } else {
      //         tempMap[listAlphabet[i].name] = [...original, result[j]];
      //       }
      //     }
      //   }
      //
      //   return tempMap;
      // }
    } catch (e) {
      print(e);
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }
}
