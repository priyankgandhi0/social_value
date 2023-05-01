const String APP_NAME = "Social Value";
// ignore_for_file: constant_identifier_names

class AppUrls {
  static const String LIVE_BASE_URL = "https://www.api.socialvaluecompany.com";

  /// Create request with query parameter
  static const String BASE_URL = "$LIVE_BASE_URL/api/";
}

class MethodNames {
  static const signIn = "sign-in";
  static const getArticleCategories = "get-article-categories";
  static const getInsurances = "get-insurances";
  static const getFundraisingIdeas = "get-fundraising-ideas";
  static const getHelplineCategories = "get-helpline-categories";
  static const getHelplines = "get-helplines";
  static const getVideos = "get-videos";
}

class RequestParam {
  static const category = "category";
  static const ids = "ids";
}

class RequestHeaderKey {
  static const bearerToken = "Authorization";
}
