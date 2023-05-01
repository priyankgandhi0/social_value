import '../api/api_helpers.dart';
import '../constant/requst_const.dart';

class DashboardRepo {
  static DashboardRepo? _instance;

  DashboardRepo._();

  static DashboardRepo get instance => _instance ??= DashboardRepo._();
  Future<dynamic> getVideos({required String ids}) async {
    dynamic result;
    var queryParameters = {
      RequestParam.ids: ids,
    };
    String queryString =
        Uri(path: MethodNames.getVideos, queryParameters: queryParameters)
            .toString();

    String requestUrl = AppUrls.BASE_URL + queryString;
    result = await BaseApiHelper.getRequest(requestUrl);
    return result;
  }
}
