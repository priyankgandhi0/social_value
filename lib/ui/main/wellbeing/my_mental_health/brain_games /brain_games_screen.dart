import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';
import 'package:social_value/widgets/app_progress.dart';
import '../../../../../constant/app_string.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../utils/routes_manager.dart';
import '../../../../../widgets/common_card.dart';
import 'brain_games_controller.dart';

class MentalHealthBrainGames extends StatelessWidget {
  MentalHealthBrainGames({Key? key}) : super(key: key);
  final BrainGamesController controller = Get.put(BrainGamesController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 25),
            child: GetBuilder<BrainGamesController>(initState: (state) {
              Future.delayed(Duration.zero)
                  .then((value) => controller.getGames());
              controller.gamesList.clear();
            }, builder: (ctrl) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      unwindWithSomeBrainGames.interTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontColor: textColor),
                    ],
                  ).paddingOnly(left: 10),
                  18.0.addHSpace(),
                  ctrl.gamesList.isEmpty
                      ? const SizedBox()
                      : GridView.builder(
                          itemCount: ctrl.gamesList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 24,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return AppBodyPumptCard(
                              onTap: () {
                                Get.toNamed(Routes.brainGamesPlayScreen,
                                    arguments: {
                                      "url": ctrl.gamesList[index].embedUrl
                                    });
                              },
                              title: ctrl.gamesList[index].title,
                              image: ctrl.gamesList[index].image,
                            );
                          },
                        )
                ],
              );
            }),
          ),
        ),
        Obx(() => controller.isLoading.value
            ? const AppProgress(
                color: darkDeepPurple,
              )
            : Container())
      ],
    );
  }
}
