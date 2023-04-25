import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_value/utils/extension.dart';
import '../../../constant/app_string.dart';
import '../../../generated/assets.dart';
import '../../../theme/app_color.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/appbar_chip.dart';
import '../../../widgets/common_textfield.dart';
import '../bottom_nav_bar/bottom_navigation_screen.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
      backGround: white,
      appbar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            AppBarChip(
              onTap: () {},
              text: myProfile,
              textColor: white,
              color: sky,
            ),
          ],
        ),
        backgroundColor: darkSky,
      ),
      color: darkSky,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            children: [
              Container(
                // height: 229,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          offset: const Offset(1, 1),
                          // spreadRadius: 1,
                          blurRadius: 2)
                    ],
                    color: backGroundColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    memberSinceFeb.interTextStyle(
                      textAlign: TextAlign.center,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    10.0.addHSpace(),
                    Image.asset(Assets.imagesMemberLogo),
                    10.0.addHSpace(),
                    memberSinceFebDesc.interTextStyle(
                      textAlign: TextAlign.center,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              20.0.addHSpace(),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(1, 1),
                        // spreadRadius: 1,
                        blurRadius: 2)
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'General Details'.interTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    20.0.addHSpace(),
                    Row(
                      children: [
                        const Flexible(
                          child: StartUpTextFiled(
                            headingText: 'Name',
                            headingTextColor: Colors.black,
                            hintText: 'Enter your name',
                            fillColor: Colors.transparent,
                            borderColor: Colors.grey,
                            fontColor: Colors.black,
                          ),
                        ),
                        20.0.addWSpace(),
                        const Flexible(
                          child: StartUpTextFiled(
                            headingText: 'name',
                            headingTextColor: white,
                            hintText: 'Enter your lastname',
                            fillColor: Colors.transparent,
                            borderColor: Colors.grey,
                            fontColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    20.0.addHSpace(),
                    const StartUpTextFiled(
                      headingText: 'Email',
                      headingTextColor: Colors.black,
                      hintText: 'Enter your email',
                      fillColor: Colors.transparent,
                      borderColor: Colors.grey,
                      fontColor: Colors.black,
                    ),
                    30.0.addHSpace(),
                    'Replace Profile Image'.interTextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    10.0.addHSpace(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Center(
                                child: 'Choose file'.interTextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            )),
                        Expanded(
                          flex: 1,
                          child: Container(
                              height: 30,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5))),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 4, bottom: 4),
                                child: ''.interTextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              )),
                        )
                      ],
                    ),
                    30.0.addHSpace(),
                    SizedBox(
                      height: 37,
                      width: 100,
                      child: AppBorderButton(
                        onTap: () {},
                        textSize: 14,
                        text: 'Update',
                        borderColor: darkSky,
                      ),
                    )
                  ],
                ).paddingSymmetric(horizontal: 15, vertical: 15),
              ),
              20.0.addHSpace(),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(1, 1),
                        // spreadRadius: 1,
                        blurRadius: 2)
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Update Password'.interTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    20.0.addHSpace(),
                    Row(
                      children: [
                        const Flexible(
                          child: StartUpTextFiled(
                            headingText: 'New Password',
                            // headingTextColor: Colors.black,
                            hintText: 'Enter New Password',
                            fillColor: Colors.transparent,
                            borderColor: Colors.grey,
                            fontColor: Colors.black,
                          ),
                        ),
                        20.0.addWSpace(),
                        const Flexible(
                          child: StartUpTextFiled(
                            headingText: 'Confirm New Password',
                            // headingTextColor: white,
                            hintText: 'Enter Confirm Password',
                            fillColor: Colors.transparent,
                            borderColor: Colors.grey,
                            fontColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    20.0.addHSpace(),
                    const StartUpTextFiled(
                      headingText: 'Current Password',
                      // headingTextColor: Colors.black,
                      hintText: 'Enter Current Password',
                      fillColor: Colors.transparent,
                      borderColor: Colors.grey,
                      fontColor: Colors.black,
                    ),
                    30.0.addHSpace(),
                    SizedBox(
                      height: 37,
                      width: 100,
                      child: AppBorderButton(
                        onTap: () {},
                        textSize: 14,
                        text: 'Update',
                        borderColor: darkSky,
                      ),
                    ),
                    10.0.addHSpace(),
                  ],
                ).paddingSymmetric(horizontal: 15, vertical: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
