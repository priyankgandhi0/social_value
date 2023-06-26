import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:social_value/constant/shred_preference.dart';
import '../../../../api/api_extension.dart';
import '../../../../models/company_model.dart';
import '../../../../models/get_affirmation_model.dart';
import '../../../../network/daily_affirmation_repo.dart';
import '../../../../network/wellbing_repo.dart';
import '../../../../theme/app_helpers.dart';

class WellbeingController extends GetxController {
  RxBool isLoading = false.obs;
  CompanyList? companyData;
  List<GetAffirmationModal> getAffirmationModal = [];
  String companyId = preferences.getString(SharedPreference.COMPANY_ID) ?? "";

  getCompany() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    dynamic result;
    result = await WellbeingRepo.instance.getCompany(id: companyId);
    try {
      companyData = CompanyList.fromJson(json.decode(result));
      await getAffirmationData();
      update();
    } catch (e) {
      print(e);
      showAppSnackBar(errorText);
    }
    isLoading.value = false;
    update();
  }

  getAffirmationData() async {
    dynamic result;
    result = await DailyAffirmationRepo.getData();
    try{
      print("result ----------> ${result.runtimeType}");
      var data = getAffirmation(result);
      getAffirmationModal = data;
      update();
    }catch(e){
      print("Error is s -->> $e");
    }
  }

}
