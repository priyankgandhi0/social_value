import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_value/constant/app_string.dart';
import 'package:social_value/models/app_tab_bar_model.dart';
import 'package:social_value/ui/main/wellbeing/physical_health/articles/articles_screen.dart';

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
      tabText: dashboard,
      tabWidget: const WellBeingDashBoardScreen(),
      onTap: () {}),
  AppTabBarModel(
      tabText: myPhysicalHealth,
      tabWidget: Column(),
      onTap: () {
        Get.toNamed(Routes.physicalHealthMainScreen);
      }),
  AppTabBarModel(
      tabText: myMentalHealth,
      tabWidget: Column(),
      onTap: () {
        Get.toNamed(Routes.mentalHealthMain);
      }),
  AppTabBarModel(
      tabText: finances,
      tabWidget: Column(),
      onTap: () {
        Get.toNamed(Routes.financeMain);
      }),
];
List<AppTabBarModel> wellbeingPhysicalHealthTabs = [
  AppTabBarModel(
      tabText: dashboard,
      tabWidget: const PhysicalHealthDashBoard(),
      onTap: () {}),
  AppTabBarModel(
      tabText: lesMills,
      tabWidget: const PhysicalHealthLesMills(),
      onTap: () {}),
  AppTabBarModel(
      tabText: bmiCalculator,
      tabWidget: const PhysicalHealthBmiCalculator(),
      onTap: () {}),
  AppTabBarModel(
      tabText: mealPlans,
      tabWidget: const PhysicalHealthMealPlans(),
      onTap: () {}),
  AppTabBarModel(
      tabText: articles,
      tabWidget: const PhysicalHealthArticleScreen(),
      onTap: () {}),
  AppTabBarModel(
      tabText: dailyWorkouts,
      tabWidget: const PhysicalHealthDailyWorkOut(),
      onTap: () {}),
];
List<AppTabBarModel> wellbeingMentalHealthTabs = [
  AppTabBarModel(
      tabText: dashboard,
      tabWidget: const MentalHealthDashBoard(),
      onTap: () {}),
  AppTabBarModel(
      tabText: mentalhealthapp,
      tabWidget: const MentalHealthApp(),
      onTap: () {}),
  AppTabBarModel(
      tabText: brainGames,
      tabWidget: const MentalHealthBrainGames(),
      onTap: () {}),
  AppTabBarModel(
      tabText: yogaVideos,
      tabWidget: const MentalHealthYogaVideo(),
      onTap: () {}),
  AppTabBarModel(
      tabText: mindfulness,
      tabWidget: const MentalHealthMainFulNess(),
      onTap: () {}),
  AppTabBarModel(
      tabText: articles, tabWidget: const MentalHealthArticles(), onTap: () {}),
  AppTabBarModel(
      tabText: supportServices,
      tabWidget: const SupportServices(),
      onTap: () {}),
];
List<AppTabBarModel> wellbeingFinanceTabs = [
  AppTabBarModel(
      tabText: dashboard, tabWidget: const FinancesDashBoard(), onTap: () {}),
  AppTabBarModel(
      tabText: insuranceQuotes,
      tabWidget: const FinancesInsuranceQuotes(),
      onTap: () {}),
  AppTabBarModel(
      tabText: discountCard,
      tabWidget: const FinancesDiscountCard(),
      onTap: () {}),
  AppTabBarModel(
      tabText: support, tabWidget: const SupportServices(), onTap: () {}),
  AppTabBarModel(
      tabText: articles, tabWidget: const FinancesArticle(), onTap: () {}),
];

List<AppTabBarModel> planetTabs = [
  AppTabBarModel(tabText: dashboard, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(
      tabText: carbonFootprintCalculator, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: webinars, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: articles, tabWidget: Column(), onTap: () {})
];
List<AppTabBarModel> communityTabs = [
  AppTabBarModel(tabText: dashboard, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: awarenessDays, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: volunteering, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: fundraising, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: discountCard, tabWidget: Column(), onTap: () {}),
];
