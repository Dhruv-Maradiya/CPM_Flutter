import 'package:flutter/material.dart';
import 'package:projectify/rest/rest_constants.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatelessWidget {
  PrivacyPolicy({super.key});

  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(Uri.parse(RestConstants.privacyPolicyUrl));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Privacy & Policy',
        isMenubarToShow: true,
      ),
      drawer: HomeScreenDrawer(),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
