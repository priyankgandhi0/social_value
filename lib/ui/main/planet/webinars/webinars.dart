import 'package:flutter/material.dart';

import '../../../../generated/asset.dart';
import '../../../../generated/assets.dart';
import '../../../../theme/app_color.dart';
import '../../../../utils/extension.dart';
import '../../../../widgets/common_card.dart';
import 'package:google_fonts/google_fonts.dart';

/*class WebinarsScreen extends StatelessWidget {
  const WebinarsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                sustainabilityWebinars.interTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontColor: textColor),
              ],
            ).paddingOnly(left: 10),
            18.0.addHSpace(),
            GridView.builder(
              itemCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 24,
              ),
              itemBuilder: (BuildContext context, int index) {
                return AppBodyPumptCard(
                  onTap: () {},
                  title: index == 0
                      ? 'Full Body resistance Training - Low Mod Level'
                      : 'Lower Bodypump Session 2',
                  image: index == 0
                      ? ImageAssets.foodImage
                      : Assets.imagesWorkoutImg,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}*/

class WebinarsScreen extends StatefulWidget {
  const WebinarsScreen({Key? key}) : super(key: key);

  @override
  State<WebinarsScreen> createState() => _WebinarsScreenState();
}

class _WebinarsScreenState extends State<WebinarsScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.0.addHSpace(),
        DefaultTabController(
          length: 2,
          child: TabBar(
            isScrollable: true,
            padding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,
            controller: controller,
            // physics: const NeverScrollableScrollPhysics(),
            indicatorWeight: 1,
            onTap: (index) {
              currentIndex = index;
            },
            indicator: indicatorWidth(darkGreen),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: darkGreen,
            automaticIndicatorColorAdjustment: true,
            labelColor: black,
            unselectedLabelColor: black,
            labelStyle: GoogleFonts.inter(
                color: white, fontWeight: FontWeight.w700, fontSize: 16),
            unselectedLabelStyle: GoogleFonts.inter(
                color: white, fontWeight: FontWeight.w700, fontSize: 16),
            tabs: const [
              Tab(
                child: Text("Sustainability Webinars"),
              ),
              Tab(child: Text("EDI Webinars")),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller!,
            children: const [SustainabilityWebinars(), EdiWebinars()],
          ),
        )
      ],
    );
  }
}

class SustainabilityWebinars extends StatelessWidget {
  const SustainabilityWebinars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              itemCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 24,
              ),
              itemBuilder: (BuildContext context, int index) {
                return AppBodyPumptCard(
                  onTap: () {},
                  title: index == 0
                      ? 'Full Body resistance Training - Low Mod Level'
                      : 'Lower Bodypump Session 2',
                  image: index == 0
                      ? ImageAssets.foodImage
                      : Assets.imagesWorkoutImg,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class EdiWebinars extends StatelessWidget {
  const EdiWebinars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
