import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:social_value/api/api_extension.dart';
import 'package:social_value/theme/app_helpers.dart';

import '../../../../models/awarness_modal.dart';
import '../../../../network/awareness_repo.dart';

class AwarenessDaysController extends GetxController {
  RxBool isLoading = false.obs;
  List<AwarenessModal> awarenessList = [];
  List<AwarenessDataModal> awarenessDataList = [];

  getAwarenessData() async {
    isLoading.value = true;
    dynamic result = await AwarenessRepo.instance.getAwareness();
    try {
      var data = awarenessModalFromJson(result);
      awarenessList = data;

      await shortList(awarenessList);
      isLoading.value = false;
      update();
    } catch (e) {
      log(e.toString());
      showAppSnackBar(errorText);
    }
  }

  shortList(List<AwarenessModal> awarenessList) {
    awarenessDataList = [];
    for (var element in awarenessList) {
      bool isExist = awarenessDataList.indexWhere((e) => e.monthString == element.monthString) != -1;
      if (!isExist) {
        awarenessDataList.add(AwarenessDataModal(
          awarenessMonth: element.start,
          monthData: awarenessList.where((a) => a.monthString == element.monthString).toList(),
          awarenessData: [],
        ));
      }
    }

    for (var awarenessMonthData in awarenessDataList) {
      /// Eg:- 1st month data
      awarenessMonthData.awarenessData = [];

      for (var dayData in awarenessMonthData.monthData) {
        // Eg :- 1st date

        bool isExist = awarenessMonthData.awarenessData.indexWhere((e) => e.dayString == dayData.dayString) != -1;
        if (!isExist) {
          awarenessMonthData.awarenessData.add(AwarenessDayDataModal(
              awarenessDay: dayData.start,
              awarenessData: awarenessMonthData.monthData.where((e) => e.start.day == dayData.start.day).toList()));
        }
      }
    }

    update();
  }

  @override
  void onInit() {
    getAwarenessData();
    // TODO: implement onInit
    super.onInit();
  }
}

class DailySales {
  final DateTime day;
  final int sales;

  DailySales(this.day, this.sales);
}
