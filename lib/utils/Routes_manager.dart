import 'package:get/get.dart';
import '../splash_screen.dart';
import '../ui/HomeScreen/Home_screen.dart';
import '../ui/Start_up/log_In/log_in_screen.dart';
import '../ui/menu_screen/menu_screen.dart';
import '../ui/wellbeing/wellbeing_home_screen/wellbeing_home_screen.dart';

class Routes {
  static String splashScreen = "/splash_screen";
  static String login = "/Log_in_screen";
  static String menuScreen = "/Menu_Screen";
  static String homeScreen = "/Home_Screen";
  static String wellBeingHomeScreen = "/WellBeing_Home_Screen";
  static List<GetPage> pages = [
    GetPage(name: Routes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: Routes.login, page: () => const LogInScreen()),
    GetPage(name: Routes.menuScreen, page: () => const MenuScreen()),
    GetPage(name: Routes.homeScreen, page: () => const HomeScreen()),
    GetPage(
        name: Routes.wellBeingHomeScreen, page: () => WellBeingHomeScreen()),
  ];
}
