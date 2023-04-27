import '../api/api_helpers.dart';
import '../constant/requst_const.dart';
import '../models/response_item.dart';

class UserStartupRepo {
  static UserStartupRepo? _instance;

  UserStartupRepo._();
  static UserStartupRepo get instance => _instance ??= UserStartupRepo._();

  /// USER LOGIN
  Future<dynamic> userSignIn({
    required String email,
    required String password,
  }) async {
    // String status;
    dynamic result;
    dynamic data;
    var params = {
      "email": email,
      "password": password,
    };
    String queryString = MethodNames.signIn;
    // String queryString = Uri(queryParameters: queryParameters).query;
    String requestUrl = AppUrls.BASE_URL + queryString;
    result = await BaseApiHelper.postRequest(
      requestUrl,
      params,
    );
    // status = result.status;
    // data = result.data;

    print("data  ${data}");
    // var message = result.message;

    return result;

    // return ResponseItem(
    //   data: data,
    //   message: message,
    //   status: status,
    // );
  }

  Future<dynamic> getArticleCategories() async {
    // bool status = false;
    dynamic result;
    // dynamic data;
    // String message;

    String queryString = MethodNames.getArticleCategories;
    // String queryString = Uri(queryParameters: queryParameters).query;
    String requestUrl = AppUrls.BASE_URL + queryString;

    result = await BaseApiHelper.getRequest(requestUrl);

    // print("data  ${data}");
    // status = result.status;
    // data = result.data;
    // message = result.message;
    return result;
    // return ResponseItem(data: data, message: message, status: status);
  }
}
