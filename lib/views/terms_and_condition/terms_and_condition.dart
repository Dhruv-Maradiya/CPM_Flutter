import 'package:flutter/material.dart';
import 'package:projectify/rest/rest_constants.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndCondition extends StatelessWidget {
  TermsAndCondition({super.key});

  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(Uri.parse(RestConstants.termsAndConditionsUrl));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Terms & Conditions',
          isMenubarToShow: true,
        ),
        drawer: HomeScreenDrawer(),
        body: WebViewWidget(controller: controller));
  }
}
