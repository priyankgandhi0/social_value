const String APP_NAME = "Social Value";
// ignore_for_file: constant_identifier_names

class AppUrls {
  static const String LIVE_BASE_URL = "https://www.api.socialvaluecompany.com";

  /// Create request with query parameter
  static const String BASE_URL = "$LIVE_BASE_URL/api/";

  static const String CARBON_FOOTPRINT_URL =
      "https://socialvaluecompany.com/household-carbon-calculator/";
  static const String GET_STARTED_FORM =
      "https://forms.zohopublic.eu/dan25/form/InsightTimerAppRequest/formperma/pKLshzm66IyxtmcC8fgdc4pzURmhfn2a43Or863ttZY";
}

class MethodNames {
  static const signIn = "sign-in";
  static const getArticleCategories = "get-article-categories";
  static const getInsurances = "get-insurances";
  static const getVolunteering = "get-volunteering-orgs";
  static const getFundraisingIdeas = "get-fundraising-ideas";
  static const getHelplineCategories = "get-helpline-categories";
  static const getHelplines = "get-helplines";
  static const getVideos = "get-videos";
  static const getVideoCategories = "get-video-categories";
  static const getArticles = "get-articles";
  static const getArticle = "get-article";
  static const getGames = "get-games";
  static const changePassword = "change-Password";
  static const editProfile = "edit-profile";
  static const getCompany = "get-company";
}

class MethodIDs {
  static const SupportVideosId = "86";
  static const wellbeingDashboardYoga = "65";
  static const wellbeingDashboardArticle =
      "5,9,10,14,15,17,22,23,24,26,29,31,32,33,34,35,36,37,38,39,40,41,442,49";
  static const physicalDashboardArticle = "31";
  static const physicalDashboardVideo = "67";
  static const mealPlanArticle = "46";
  static const physicalArticle = "31";
  static const physicalDailyWorkout = "67";
  static const mentalDashboardVideo = "71";
  static const mentalDashboardArticle = "30";
  static const mentalYogaVideo = "83";
  static const mentalMindfulNessVideo = "71";
  static const mentalArticle = "30";
  static const financesDashboardArticle = "42";
  static const financesArticle = "42,29,5,26";
  static const sustainabilityWebinars = "89,90";
  static const EdiWebinars = "64";
  static const sustainabilityArticles = "11";
  static const EdiArticles = "13";
  static const communityDashboardArticle = "12,60";
}

class RequestParam {
  static const category = "category";
  static const ids = "ids";
  static const id = "id";
}

class RequestHeaderKey {
  static const bearerToken = "Authorization";
}
