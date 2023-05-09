import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_value/constant/app_string.dart';
import 'package:social_value/models/app_tab_bar_model.dart';
import 'package:social_value/ui/main/wellbeing/physical_health/articles/articles_screen.dart';

import '../ui/main/community/awareness_days/awareness_days.dart';
import '../ui/main/community/charity_Page/charity_Page.dart';
import '../ui/main/community/communitty_dashboard/community_dashboard.dart';
import '../ui/main/community/discount_card/discount_card.dart';
import '../ui/main/community/fundraising/fundraising.dart';
import '../ui/main/community/volunteering_screen/volunteering_screen.dart';
import '../ui/main/planet/articles/articles.dart';
import '../ui/main/planet/carbon_footprint_calculator/carbon_footprint_calculator.dart';
import '../ui/main/planet/planet_dashboard/planet_dashboard.dart';
import '../ui/main/planet/webinars/webinars.dart';
import '../ui/main/wellbeing/finances/ articles/finances_artical_screen.dart';
import '../ui/main/wellbeing/finances/discount_card/discount_card_screen.dart';
import '../ui/main/wellbeing/finances/finances_dashboard/finances_dashboard.dart';
import '../ui/main/wellbeing/finances/insurance_quotes/insurance_quotes_screen.dart';
import '../ui/main/wellbeing/my_mental_health/articles/articles_screen.dart';
import '../ui/main/wellbeing/my_mental_health/brain_games /brain_games_screen.dart';
import '../ui/main/wellbeing/my_mental_health/mental_health_dashboard/mental_health_dashboard.dart';
import '../ui/main/wellbeing/my_mental_health/mentall_health_app/mental_health_app.dart';
import '../ui/main/wellbeing/my_mental_health/mindfulness/mindfulness_screen.dart';
import '../ui/main/wellbeing/my_mental_health/yoga_videos/yoga_vidoes_screen.dart';
import '../ui/main/wellbeing/physical_health/bmi_calculator/bmi_calculator_screen.dart';
import '../ui/main/wellbeing/physical_health/daily_workouts/daily_workouts_screen.dart';
import '../ui/main/wellbeing/physical_health/les_mills/les_mills_screen.dart';
import '../ui/main/wellbeing/physical_health/meal_plans/meal_plans_screen.dart';
import '../ui/main/wellbeing/physical_health/physical_health_dashboard/physical_health_dashboard.dart';
import '../ui/main/wellbeing/wellbeing_dashboard/wellbeing_dashboard_screen.dart';
import '../ui/support_services/support_services.dart';
import '../utils/routes_manager.dart';

List<AppTabBarModel> wellbeingTabs = [
  AppTabBarModel(
      tabText: dashboard, tabWidget: WellBeingDashBoardScreen(), onTap: () {}),
  AppTabBarModel(
      tabText: myPhysicalHealth,
      tabWidget: Column(),
      onTap: () {
        Get.toNamed(Routes.physicalHealthMainScreen,
            arguments: {"selectedPage": 0});
      }),
  AppTabBarModel(
      tabText: myMentalHealth,
      tabWidget: Column(),
      onTap: () {
        Get.toNamed(Routes.mentalHealthMain, arguments: {"selectedPage": 0});
      }),
  AppTabBarModel(
      tabText: finances,
      tabWidget: Column(),
      onTap: () {
        Get.toNamed(Routes.financeMain, arguments: {"selectedPage": 0});
      }),
];
List<AppTabBarModel> wellbeingPhysicalHealthTabs = [
  AppTabBarModel(
      tabText: dashboard, tabWidget: PhysicalHealthDashBoard(), onTap: () {}),
  AppTabBarModel(
      tabText: lesMills, tabWidget: PhysicalHealthLesMills(), onTap: () {}),
  AppTabBarModel(
      tabText: bmiCalculator,
      tabWidget: PhysicalHealthBmiCalculator(),
      onTap: () {}),
  AppTabBarModel(
      tabText: mealPlans, tabWidget: PhysicalHealthMealPlans(), onTap: () {}),
  AppTabBarModel(
      tabText: articles,
      tabWidget: PhysicalHealthArticleScreen(),
      onTap: () {}),
  AppTabBarModel(
      tabText: dailyWorkouts,
      tabWidget: const PhysicalHealthDailyWorkOut(),
      onTap: () {}),
];
List<AppTabBarModel> wellbeingMentalHealthTabs = [
  AppTabBarModel(
      tabText: dashboard, tabWidget: MentalHealthDashBoard(), onTap: () {}),
  AppTabBarModel(
      tabText: mentalhealthapp,
      tabWidget: const MentalHealthApp(),
      onTap: () {}),
  AppTabBarModel(
      tabText: brainGames, tabWidget: MentalHealthBrainGames(), onTap: () {}),
  AppTabBarModel(
      tabText: yogaVideos,
      tabWidget: const MentalHealthYogaVideo(),
      onTap: () {}),
  AppTabBarModel(
      tabText: mindfulness, tabWidget: MentalHealthMainFulNess(), onTap: () {}),
  AppTabBarModel(
      tabText: articles, tabWidget: MentalHealthArticles(), onTap: () {}),
  AppTabBarModel(
      tabText: supportServices, tabWidget: SupportServices(), onTap: () {}),
];
List<AppTabBarModel> wellbeingFinanceTabs = [
  AppTabBarModel(
      tabText: dashboard, tabWidget: const FinancesDashBoard(), onTap: () {}),
  AppTabBarModel(
      tabText: insuranceQuotes,
      tabWidget: FinancesInsuranceQuotes(),
      onTap: () {}),
  AppTabBarModel(
      tabText: discountCard,
      tabWidget: const FinancesDiscountCard(),
      onTap: () {}),
  AppTabBarModel(tabText: support, tabWidget: SupportServices(), onTap: () {}),
  AppTabBarModel(
      tabText: articles, tabWidget: const FinancesArticle(), onTap: () {}),
];

List<AppTabBarModel> planetTabs = [
  AppTabBarModel(
      tabText: dashboard, tabWidget: PlanetDashboard(), onTap: () {}),
  AppTabBarModel(
      tabText: carbonFootprintCalculator,
      tabWidget: CarbonFootPrintCalculator(),
      onTap: () {}),
  AppTabBarModel(
      tabText: webinars, tabWidget: const WebinarsScreen(), onTap: () {}),
  AppTabBarModel(
      tabText: articles, tabWidget: const ArticlesScreen(), onTap: () {})
];
List<AppTabBarModel> communityTabs = [
  AppTabBarModel(
      tabText: dashboard, tabWidget: const CommunityDashboard(), onTap: () {}),
  AppTabBarModel(
      tabText: awarenessDays,
      tabWidget: const AwarenessDaysScreen(),
      onTap: () {}),
  AppTabBarModel(
      tabText: volunteering,
      tabWidget: const VolunteeringScreen(),
      onTap: () {}),
  AppTabBarModel(
      tabText: fundraising, tabWidget: FundraisingScreen(), onTap: () {}),
  AppTabBarModel(
      tabText: discountCard, tabWidget: const DiscountCard(), onTap: () {}),
  AppTabBarModel(
      tabText: charityPage, tabWidget: const CharityPage(), onTap: () {}),
];
