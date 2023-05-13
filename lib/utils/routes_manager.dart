import 'package:get/get.dart';
import 'package:social_value/ui/main/community/community_main/community_main.dart';
import 'package:social_value/ui/main/help_support/help_support.dart';
import 'package:social_value/ui/main/planet/planet_main/planet_main.dart';
import 'package:social_value/ui/main/soical_value_score_page/soical_value_score.dart';
import 'package:social_value/ui/main/terms_condition/terms_condition.dart';
import '../splash_screen.dart';
import '../ui/Start_up/log_In/log_in_screen.dart';

import '../ui/main/common_screen/article__detail_screen/article_detail_screen.dart';
import '../ui/main/common_screen/brain_gamesplay_screen.dart';
import '../ui/main/common_screen/workout_video_screen.dart';
import '../ui/main/dashboard_screen/dashboard_screen.dart';
import '../ui/main/menu_screen/menu_screen.dart';
import '../ui/main/my_profile/my_profile.dart';
import '../ui/main/planet/carbon_footprint_calculator/carbon_footprint_calculator.dart';
import '../ui/main/staff_survey/staff_survey.dart';
import '../ui/main/staff_survey/staffsurvey_question.dart';
import '../ui/main/wellbeing/all_article/all_article_screen.dart';
import '../ui/main/wellbeing/finances/finances_main/finances_main.dart';
import '../ui/main/wellbeing/my_mental_health/mental_health_main/mental_health_main.dart';
import '../ui/main/wellbeing/physical_health/physical_health_main/physical_health_mainscreen.dart';
import '../ui/main/wellbeing/wellbeing_main/wellbeing_main_screen.dart';
import '../ui/main/common_screen/video-player.dart';

class Routes {
  static String splashScreen = "/splash_screen";
  static String login = "/Log_in_screen";
  static String menuScreen = "/Menu_Screen";
  static String dashboardScreen = "/Dashboard_Screen";
  static String wellBeingDashBoardScreen = "/WellBeing_Main";
  static String physicalHealthMainScreen = "/Physical_Health_MainScreen";
  static String mentalHealthMain = "/Mental_Health_Main";
  static String financeMain = "/Finance_Main";
  static String allArticleScreen = "/All_Article_Screen";
  static String planetMain = "/Planet_Main";
  static String communityMain = "/Community_Main";
  static String staffSurveyScreen = "/Staff_Survey_Screen";
  static String staffSurveyQuestion = "/StaffSurvey_Question";
  static String termsCondition = "/termsCondition";
  static String helpSupport = "/helpSupport";
  static String myProfileScreen = "/MyProfile_Screen";
  static String articleDetailScreen = "/Article_Detail_Screen";
  static String socialValueScore = "/socialValueScore";
  static String videoPlayerScreen = "/VideoPlayerScreen";
  static String workOutVideoScreen = "/WorkOutVideoScreen";
  static String brainGamesPlayScreen = "/BrainGamesPlayScreen";
  static String carbonFootPrintCalculator = "/CarbonFootPrintCalculator";

  static List<GetPage> pages = [
    GetPage(
        name: Routes.splashScreen,
        page: () => const SplashScreen(),
        transition: Transition.noTransition),
    GetPage(name: Routes.login, page: () => LogInScreen()),
    GetPage(
        name: Routes.menuScreen,
        page: () => const MenuScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.dashboardScreen,
        page: () => DashboardScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.wellBeingDashBoardScreen,
        page: () => const WellBeingMain(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.physicalHealthMainScreen,
        page: () => const PhysicalHealthMainScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.mentalHealthMain,
        page: () => const MentalHealthMain(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.financeMain,
        page: () => FinanceMain(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.allArticleScreen,
        page: () => AllArticleScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.planetMain,
        page: () => const PlanetMain(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.communityMain,
        page: () => CommunityMain(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.termsCondition,
        page: () => const TermsCondition(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.helpSupport,
        page: () => HelpSupport(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.staffSurveyScreen,
        page: () => const StaffSurveyScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.staffSurveyQuestion,
        page: () => const StaffSurveyQuestion(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.myProfileScreen,
        page: () => MyProfileScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.articleDetailScreen,
        page: () => ArticleDetailScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.socialValueScore,
        page: () => const SocialValueScore(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.videoPlayerScreen,
        page: () => VideoPlayerScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.carbonFootPrintCalculator,
        page: () => CarbonFootPrintCalculator(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.workOutVideoScreen,
        page: () => WorkOutVideoScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.brainGamesPlayScreen,
        page: () => BrainGamesPlayScreen(),
        transition: Transition.noTransition),
  ];
}
