import 'package:get/get.dart';
import 'package:social_value/api/api_helpers.dart';
import 'package:social_value/constant/requst_const.dart';
import 'package:social_value/models/awarness_modal.dart';

class AwarenessRepo{
  static AwarenessRepo? _instance;

  AwarenessRepo._();

  static AwarenessRepo get instance => _instance ??= AwarenessRepo._();

  getAwareness () async {
    dynamic result;

    String requestUrl = AppUrls.BASE_URL + MethodNames.awarenessDays;
    result = await BaseApiHelper.getRequest(requestUrl);
    return result;
  }


}