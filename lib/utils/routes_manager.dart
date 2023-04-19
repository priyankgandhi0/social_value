import 'package:get/get.dart';
import '../splash_screen.dart';

import '../ui/Start_up/log_In/log_in_screen.dart';
import '../ui/main/homescreen/Home_screen.dart';
import '../ui/main/menu_screen/menu_screen.dart';

import '../ui/main/wellbeing/physical_health/physical_Health_HomeScreen.dart';
import '../ui/main/wellbeing/wellbeing_home_screen/wellbeing_home_screen.dart';

class Routes {
  static String splashScreen = "/splash_screen";
  static String login = "/Log_in_screen";
  static String menuScreen = "/Menu_Screen";
  static String homeScreen = "/Home_Screen";
  static String wellBeingHomeScreen = "/WellBeing_Home_Screen";
  static String physicalHealthHomeScreen = "/Physical_Health_HomeScreen";
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
        name: Routes.homeScreen,
        page: () => const HomeScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.wellBeingHomeScreen,
        page: () => WellBeingHomeScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.physicalHealthHomeScreen,
        page: () => PhysicalHealthHomeScreen(),
        transition: Transition.noTransition),
  ];
}
