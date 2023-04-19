import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_value/constant/app_string.dart';
import 'package:social_value/models/app_tab_bar_model.dart';
import 'package:social_value/ui/main/wellbeing/physical_health/articles/articles_screen.dart';

import '../utils/routes_manager.dart';

List<AppTabBarModel> wellbeingTabs = [
  AppTabBarModel(tabText: dashboard, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(
      tabText: myPhysicalHealth,
      tabWidget: Column(),
      onTap: () {
        Get.toNamed(Routes.physicalHealthHomeScreen);
      }),
  AppTabBarModel(
      tabText: myMentalHealth,
      tabWidget: Column(),
      onTap: () {
        Get.toNamed(Routes.mentalHealthDashboard);
      }),
  AppTabBarModel(
      tabText: finances,
      tabWidget: Column(),
      onTap: () {
        Get.toNamed(Routes.financeDashboard);
      }),
];
List<AppTabBarModel> wellbeingPhysicalHealthTabs = [
  AppTabBarModel(tabText: dashboard, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: lesMills, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: bmiCalculator, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: mealPlans, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: articles, tabWidget: ArticleScreen(), onTap: () {}),
  AppTabBarModel(tabText: dailyWorkouts, tabWidget: Column(), onTap: () {}),
];
List<AppTabBarModel> wellbeingMentalHealthTabs = [
  AppTabBarModel(tabText: dashboard, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: mentalhealthapp, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: brainGames, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: yogaVideos, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: mindfulness, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: articles, tabWidget: ArticleScreen(), onTap: () {}),
];
List<AppTabBarModel> wellbeingFinanceTabs = [
  AppTabBarModel(tabText: dashboard, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: insuranceQuotes, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: discountCard, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: support, tabWidget: Column(), onTap: () {}),
  AppTabBarModel(tabText: articles, tabWidget: ArticleScreen(), onTap: () {}),
];
