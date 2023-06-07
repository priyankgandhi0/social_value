import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:social_value/constant/requst_const.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/widgets/app_progress.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CarbonFootPrintCalculator extends StatefulWidget {
  const CarbonFootPrintCalculator({Key? key}) : super(key: key);

  @override
  State<CarbonFootPrintCalculator> createState() => _CarbonFootPrintCalculatorState();
}

class _CarbonFootPrintCalculatorState extends State<CarbonFootPrintCalculator> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: WebView(
            backgroundColor: Colors.white,
            gestureNavigationEnabled: true,
            gestureRecognizers: Set()..add(Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())),
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: AppUrls.CARBON_FOOTPRINT_URL,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          ),
        ),
        Visibility(
          visible: isLoading,
          child: const Center(
            child: AppProgress(
              color: darkGreen,
            ),
          ),
        )
      ],
    );
    /*return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              householdCarbonFootprintCalculator.interTextStyle(
                  fontWeight: FontWeight.w700, fontSize: 16),
              28.0.addHSpace(),
              Image.asset(
                ImageAssets.round,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
              13.0.addHSpace(),
              generalInformation.interTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  fontColor: const Color(0xff444444)),
              30.0.addHSpace(),
              generalInformationDesc.interTextStyle(
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
              30.0.addHSpace(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            StartUpTextFiled(
                              fontColor: Colors.black,
                              headingText: "Name",
                              headingTextColor: textColor,
                              isCursorShow: true,
                              borderColor: Colors.grey.shade300,
                              fillColor: backGroundColor,
                              controller: controller.nameCtr,
                              validator: (_) {
                                if (controller.nameCtr.text.isEmpty) {
                                  return pleaseEnterName;
                                }
                                return null;
                              },
                            ),
                            4.0.addHSpace(),
                            Row(
                              children: [
                                firstName.interTextStyle(
                                    fontColor: const Color(0xff555555),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)
                              ],
                            )
                          ],
                        ),
                      ),
                      20.0.addWSpace(),
                      Flexible(
                        child: Column(
                          children: [
                            StartUpTextFiled(
                              fontColor: Colors.black,
                              headingText: "dsew",
                              headingTextColor: backGroundColor,
                              isCursorShow: true,
                              borderColor: Colors.grey.shade300,
                              fillColor: backGroundColor,
                              controller: controller.lastNameCtr,
                              validator: (_) {
                                if (controller.lastNameCtr.text.isEmpty) {
                                  return pleaseEnterName;
                                }
                                return null;
                              },
                            ),
                            4.0.addHSpace(),
                            Row(
                              children: [
                                lastName.interTextStyle(
                                    fontColor: backGroundColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  20.0.addHSpace(),
                  Row(
                    children: [
                      Flexible(
                        child: StartUpTextFiled(
                          fontColor: Colors.black,
                          headingText: "Email",
                          headingTextColor: textColor,
                          isCursorShow: true,
                          borderColor: Colors.grey.shade300,
                          fillColor: backGroundColor,
                          textInputType: TextInputType.emailAddress,
                          controller: controller.emailCtr,
                          validator: (_) {
                            if (controller.emailCtr.text.isEmpty) {
                              return pleaseEnterEmailAddress;
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(_!)) {
                              return enterValidEmail;
                              // 'Enter Valid $message';
                            }
                            return null;
                          },
                        ),
                      ),
                      20.0.addWSpace(),
                      const Flexible(child: SizedBox()),
                    ],
                  ),
                ],
              ),
              60.0.addHSpace(),
              AppFilledButton(
                width: 110,
                buttonColor: darkGreen,
                text: next,
                onTap: () {
                  if (controller.formKey.currentState!.validate()) {}
                },
              )
            ],
          ),
        ),
      ),
    );*/
  }
}
