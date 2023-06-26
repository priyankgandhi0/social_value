import 'package:get/get.dart';

import '../api/api_helpers.dart';
import '../constant/requst_const.dart';

class DailyAffirmationRepo {
  static getData() async {
    dynamic result;
      String requestUrl = AppUrls.BASE_URL + MethodNames.getAffirmation;
      result = await BaseApiHelper.getRequest(requestUrl);
      return result;
  }
}