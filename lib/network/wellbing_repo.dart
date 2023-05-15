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

  Future<dynamic> getHelplineCategories() async {
    dynamic result;
    String queryString = MethodNames.getHelplineCategories;
    String requestUrl = AppUrls.BASE_URL + queryString;
    result = await BaseApiHelper.getRequest(requestUrl);
    return result;
  }

  Future<dynamic> getHelplines({required String category}) async {
    dynamic result;

    var queryParameters = {
      RequestParam.category: category,
    };
    String queryString =
        Uri(path: MethodNames.getHelplines, queryParameters: queryParameters)
            .toString();
    // String queryString = MethodNames.getHelplines;
    String requestUrl = AppUrls.BASE_URL + queryString;

    result = await BaseApiHelper.getRequest(requestUrl);
    return result;
  }

  Future<dynamic> getArticleCategories() async {
    dynamic result;
    String queryString = MethodNames.getArticleCategories;
    // String queryString = Uri(queryParameters: queryParameters).query;
    String requestUrl = AppUrls.BASE_URL + queryString;

    result = await BaseApiHelper.getRequest(requestUrl);

    return result;
  }

  Future<dynamic> getArticles({required String ids}) async {
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
    String queryString =
        Uri(path: MethodNames.getArticles, queryParameters: queryParameters)
            .toString();

    String requestUrl = AppUrls.BASE_URL + queryString;
    result = await BaseApiHelper.getRequest(requestUrl);
    return result;
  }

  Future<dynamic> getSingleArticle({required String id}) async {
    dynamic result;
    var queryParameters = {
      RequestParam.id: id,
    };
    String queryString =
        Uri(path: MethodNames.getArticle, queryParameters: queryParameters)
            .toString();

    String requestUrl = AppUrls.BASE_URL + queryString;
    result = await BaseApiHelper.getRequest(requestUrl);
    return result;
  }

  Future<dynamic> getVideoCategories() async {
    dynamic result;
    String queryString = MethodNames.getVideoCategories;
    // String queryString = Uri(queryParameters: queryParameters).query;
    String requestUrl = AppUrls.BASE_URL + queryString;

    result = await BaseApiHelper.getRequest(requestUrl);

    return result;
  }

  Future<dynamic> getGames() async {
    dynamic result;
    String queryString = MethodNames.getGames;
    String requestUrl = AppUrls.BASE_URL + queryString;
    result = await BaseApiHelper.getRequest(requestUrl);
    return result;
  }

  Future<dynamic> getCompany({required String id}) async {
    dynamic result;

    var queryParameters = {RequestParam.id: id};
    String queryString =
        Uri(path: MethodNames.getCompany, queryParameters: queryParameters)
            .toString();

    String requestUrl = AppUrls.BASE_URL + queryString;
    result = await BaseApiHelper.getRequest(requestUrl);
    return result;
  }
}
