import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../constant/app_string.dart';
import '../../../constant/app_url.dart';
import '../../../theme/app_color.dart';
import '../../../widgets/appbar_chip.dart';
import '../bottom_nav_bar/bottom_navigation_screen.dart';

class PrivacyCenterScreen extends StatelessWidget {
  const PrivacyCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNaviBarScreen(
      color: darkSky,
      backGround: white,
      bottomColor : darkSky,
      appbar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            AppBarChip(
              onTap: () {},
              text: privacyCenter,
              textColor: white,
              color: sky,
            ),
          ],
        ),
        backgroundColor: darkSky,
      ), child: const WebView(
      backgroundColor: Colors.white,
      initialUrl: privacyUrl,
      javascriptMode: JavascriptMode.unrestricted,
    ),
    );
  }
}
