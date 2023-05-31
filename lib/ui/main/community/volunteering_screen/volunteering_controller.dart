

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../api/api_extension.dart';
import '../../../../models/volunteering_model.dart';
import '../../../../network/community_repo.dart';
import '../../../../theme/app_helpers.dart';

class VolunteeringController extends GetxController{
  RxBool isLoading = false.obs;

  List<VolunteeringModel> getVolunteeringData = [];

  getVolunteering() async {
    getVolunteeringData.clear();
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await CommunityRepo.instance.getVolunteeringData();
    try {
      //print("volunteeringData${json.decode(result)}");
      var data = volunteeringFromJson(result ?? []);
      getVolunteeringData = data;
      print(getVolunteeringData);
    } catch (e) {
      print(e);
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }

}