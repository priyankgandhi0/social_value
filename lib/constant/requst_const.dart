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
}

class RequestParam {
  static const page = "page";
}

class RequestHeaderKey {
  static const bearerToken = "Authorization";
}
