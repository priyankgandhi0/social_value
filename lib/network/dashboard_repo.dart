import '../api/api_helpers.dart';
import '../constant/requst_const.dart';

class DashboardRepo {
  static DashboardRepo? _instance;

  DashboardRepo._();

  static DashboardRepo get instance => _instance ??= DashboardRepo._();
  Future<dynamic> getVideos({required String ids}) async {
    dynamic result;
    List<String> iDs = [];
    iDs.add(ids);
    var queryParameters = {
      RequestParam.ids: iDs
          .toString()
          .replaceAll(
            '[',
            '',
          )
          .replaceAll(']', ''),
    };
    String queryString = Uri(path: MethodNames.getVideos, queryParameters: queryParameters).toString();

    String requestUrl = AppUrls.BASE_URL + queryString;
    result = await BaseApiHelper.getRequest(requestUrl);
    return result;
  }
}
