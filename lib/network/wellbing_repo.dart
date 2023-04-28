import '../api/api_helpers.dart';
import '../constant/requst_const.dart';

class WellbeingRepo {
  static WellbeingRepo? _instance;

  WellbeingRepo._();

  static WellbeingRepo get instance => _instance ??= WellbeingRepo._();

  Future<dynamic> getInsurances() async {
    dynamic result;
    String queryString = MethodNames.getInsurances;
    String requestUrl = AppUrls.BASE_URL + queryString;
    result = await BaseApiHelper.getRequest(requestUrl);
    return result;
  }
}
