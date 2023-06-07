import '../api/api_helpers.dart';
import '../constant/requst_const.dart';

class FaQsRepo{
  static FaQsRepo? _instance;

  FaQsRepo._();


  static FaQsRepo get instance => _instance ??= FaQsRepo._();


  getFaq() async {
    dynamic result;
    // String queryString = Uri(path: MethodNames.getFaqs).toString();
    // print("queryString -----> ${queryString}");
    String requestUrl = AppUrls.BASE_URL +  MethodNames.getFaqs;
    result = await BaseApiHelper.getRequest(requestUrl);
    return result;
  }


}