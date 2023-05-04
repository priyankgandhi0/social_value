import 'package:get/get.dart';
import 'package:social_value/models/home_card_model.dart';

import '../theme/app_color.dart';
import '../utils/routes_manager.dart';
import 'app_string.dart';

List<HomeCardModel> homeCard = [
  HomeCardModel(
    onTap: () {
      Get.toNamed(Routes.wellBeingDashBoardScreen);
    },
    title: wellbeingHub,
    desc: wellbeingHubText,
    image: "https://www.app.socialvaluecompany.com/assets/img/wellnesshub.jpg",
    color: darkDeepPurple,
  ),
  HomeCardModel(
    onTap: () {
      Get.toNamed(Routes.planetMain);
    },
    title: sustainabilityHub,
    desc: sustainabilityHubText,
    image:
        "https://www.app.socialvaluecompany.com/assets/img/community_hub.png",
    color: darkGreen,
  ),
  HomeCardModel(
    onTap: () {},
    title: ediHub,
    desc: ediHubText,
    image: "https://www.app.socialvaluecompany.com/assets/img/equility_hub.png",
    color: darkSky,
  ),
  HomeCardModel(
    onTap: () {
      Get.toNamed(Routes.communityMain);
    },
    title: communityHub,
    desc: communityHubText,
    image: "https://www.app.socialvaluecompany.com/assets/img/comm-hub.png",
    color: darkOrange,
  ),
];
