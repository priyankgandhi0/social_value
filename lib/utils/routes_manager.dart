import 'package:get/get.dart';
import '../splash_screen.dart';
import '../ui/Start_up/log_In/log_in_screen.dart';
import '../ui/main/dashboard_screen/dashboard_screen.dart';

import '../ui/main/menu_screen/menu_screen.dart';

import '../ui/main/wellbeing/finances/finances_dashboard/finances_dashboard.dart';
import '../ui/main/wellbeing/my_mental_health/mental_health_dashboard/mental_health_dashboard.dart';
import '../ui/main/wellbeing/physical_health/physical_health_dashboard/physical_health_dashboard.dart';
import '../ui/main/wellbeing/wellbeing_dashboard/wellbeing_dashboard_screen.dart';

class Routes {
  static String splashScreen = "/splash_screen";
  static String login = "/Log_in_screen";
  static String menuScreen = "/Menu_Screen";
  static String dashboardScreen = "/Dashboard_Screen";
  static String wellBeingHomeScreen = "/WellBeing_Home_Screen";
  static String physicalHealthHomeScreen = "/Physical_Health_HomeScreen";
  static String mentalHealthDashboard = "/Mental_Health_Dashboard";
  static String financeDashboard = "/Finance_Dashboard";
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
        name: Routes.wellBeingHomeScreen,
        page: () => WellBeingHomeScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.physicalHealthHomeScreen,
        page: () => PhysicalHealthHomeScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.mentalHealthDashboard,
        page: () => MentalHealthDashboard(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.financeDashboard,
        page: () => FinanceDashboard(),
        transition: Transition.noTransition),
  ];
}
