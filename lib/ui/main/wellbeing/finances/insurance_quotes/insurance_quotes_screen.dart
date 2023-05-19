import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';
import 'package:social_value/widgets/common_card.dart';
import '../../../../../constant/app_string.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../widgets/app_progress.dart';
import 'insurance_quotes_contoller.dart';

class FinancesInsuranceQuotes extends StatelessWidget {
  FinancesInsuranceQuotes({Key? key}) : super(key: key);

  final InsuranceController controller = Get.find<InsuranceController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            child: GetBuilder<InsuranceController>(initState: (state) {
              Future.delayed(Duration.zero)
                  .then((value) => controller.getInsurances());
            }, builder: (ctrl) {
              return Column(
                children: [
                  saveOnInsuranceQuotes.interTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontColor: textColor),
                  15.0.addHSpace(),
                  getQuotesFromARangeOfProviders.interTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontColor: textColor),
                  15.0.addHSpace(),
                  selectTheTypeOfInsuranceYouRequire.interTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontColor: const Color(0xff555555)),
                  27.0.addHSpace(),
                  const CircleAvatar(
                    backgroundColor: darkDeepPurple,
                    child: Icon(
                      Icons.arrow_downward,
                      color: white,
                    ),
                  ),
                  27.0.addHSpace(),
                  GridView.builder(
                    itemCount: ctrl.getInsurance.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // crossAxisSpacing: 20,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InsuranceCard(
                        title: ctrl.getInsurance[index].title,
                        // icon: ctrl.getInsurance[index].fontAwesomeIcon,
                      );
                    },
                  ),
                ],
              );
            }),
          ),
        ),
        Obx(() => controller.isLoading.value || controller.isLoading.value
            ? const AppProgress(
                color: darkDeepPurple,
              )
            : Container()),
      ],
    );
  }
// @override
// void initState() {
//   webViewController = WebViewController()
//     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     ..setBackgroundColor(const Color(0x00000000))
//     ..loadHtmlString(HtmlConst.privacyPolicyHtml);
//   super.initState();
// }
}
