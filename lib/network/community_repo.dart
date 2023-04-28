import '../api/api_helpers.dart';
import '../constant/requst_const.dart';

class CommunityRepo {
  static CommunityRepo? _instance;

  CommunityRepo._();

  static CommunityRepo get instance => _instance ??= CommunityRepo._();

  Future<dynamic> getFundraisingIdeas() async {
    dynamic result;
    String queryString = MethodNames.getFundraisingIdeas;
    String requestUrl = AppUrls.BASE_URL + queryString;
    result = await BaseApiHelper.getRequest(requestUrl);
    return result;
  }
}