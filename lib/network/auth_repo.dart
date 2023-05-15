import '../api/api_helpers.dart';
import '../constant/requst_const.dart';

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

    // log("data  ${data}");
    // var message = result.message;

    return result;

    // return ResponseItem(
    //   data: data,
    //   message: message,
    //   status: status,
    // );
  }

  Future<dynamic> changePassword({
    required String email,
    required String password,
    required String id,
  }) async {
    dynamic result;
    var params = {
      "email": email,
      "password": password,
      "id": id,
    };
    String queryString = MethodNames.changePassword;
    String requestUrl = AppUrls.BASE_URL + queryString;
    result = await BaseApiHelper.postRequest(requestUrl, params);
    return result;
  }

  Future<dynamic> editProfile({
    required String email,
    required String id,
    required String firstname,
    required String lastname,
  }) async {
    dynamic result;
    var params = {
      "email": email,
      "id": id,
      "firstname": firstname,
      "lastname": lastname,
    };
    String queryString = MethodNames.editProfile;
    String requestUrl = AppUrls.BASE_URL + queryString;
    result = await BaseApiHelper.postRequest(requestUrl, params);
    return result;
  }
}
