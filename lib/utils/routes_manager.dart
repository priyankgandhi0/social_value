import 'package:get/get.dart';
import 'package:social_value/ui/main/community/community_main/community_main.dart';
import 'package:social_value/ui/main/planet/planet_main/planet_main.dart';
import '../splash_screen.dart';
import '../ui/Start_up/log_In/log_in_screen.dart';
import '../ui/main/dashboard_screen/dashboard_screen.dart';
import '../ui/main/menu_screen/menu_screen.dart';
import '../ui/main/staff_survey/staff_survey.dart';
import '../ui/main/staff_survey/staffsurvey_question.dart';
import '../ui/main/wellbeing/finances/finances_main/finances_main.dart';
import '../ui/main/wellbeing/my_mental_health/mental_health_main/mental_health_main.dart';
import '../ui/main/wellbeing/physical_health/physical_health_main/physical_health_mainscreen.dart';
import '../ui/main/wellbeing/wellbeing_main/wellbeing_main_screen.dart';

class Routes {
  static String splashScreen = "/splash_screen";
  static String login = "/Log_in_screen";
  static String menuScreen = "/Menu_Screen";
  static String dashboardScreen = "/Dashboard_Screen";
  static String wellBeingDashBoardScreen = "/WellBeing_Main";
  static String physicalHealthMainScreen = "/Physical_Health_MainScreen";
  static String mentalHealthMain = "/Mental_Health_Main";
  static String financeMain = "/Finance_Main";
  static String planetMain = "/Planet_Main";
  static String communityMain = "/Community_Main";
  static String staffSurveyScreen = "/Staff_Survey_Screen";
  static String staffSurveyQuestion = "/StaffSurvey_Question";

  static List<GetPage> pages = [
    GetPage(
        name: Routes.splashScreen,
        page: () => const SplashScreen(),
        transition: Transition.noTransition),
    GetPage(name: Routes.login, page: () => const LogInScreen()),
    GetPage(
        name: Routes.menuScreen,
        page: () => const MenuScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.dashboardScreen,
        page: () => const DashboardScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.wellBeingDashBoardScreen,
        page: () => WellBeingMain(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.physicalHealthMainScreen,
        page: () => PhysicalHealthMainScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.mentalHealthMain,
        page: () => MentalHealthMain(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.financeMain,
        page: () => FinanceMain(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.planetMain,
        page: () => PlanetMain(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.communityMain,
        page: () => CommunityMain(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.staffSurveyScreen,
        page: () => const StaffSurveyScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.staffSurveyQuestion,
        page: () => StaffSurveyQuestion(),
        transition: Transition.noTransition),
  ];
}
