import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/utils/extension.dart';
import '../../../constant/app_string.dart';
import '../../../generated/asset.dart';
import '../../../utils/routes_manager.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/common_textfield.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreen,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(IconsAssets.heart),
                32.0.addHSpace(),
                logIn.appEpilogueTextStyle(
                    fontColor: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
                70.0.addHSpace(),
                const StartUpTextFiled(
                    headingText: emailAddress, headingTextColor: white),
                37.0.addHSpace(),
                const StartUpTextFiled(
                    headingText: password, headingTextColor: white),
                56.0.addHSpace(),
                AppFilledButton(
                  text: logIn,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontColor: const Color(0xff000000),
                  onTap: () {
                    Get.toNamed(Routes.homeScreen);
                  },
                ),
                50.0.addHSpace(),
                forgottenPassword.interTextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontColor: white,
                    textDecoration: TextDecoration.underline),
                12.0.addHSpace(),
                needAnAccount.interTextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontColor: white,
                    textDecoration: TextDecoration.underline),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
