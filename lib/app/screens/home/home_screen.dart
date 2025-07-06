import 'package:flutter/material.dart';
import 'package:proggenius_test/app/common/widgets/main_app_bar.dart';
import 'package:proggenius_test/app/screens/bottom_sheets/main_bottom_sheet/main_bottom_sheet_factory.dart';
import 'package:proggenius_test/app/screens/bottom_sheets/web_view/web_view_factory.dart';

part 'widgets/_body_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final String homeTitle = 'ProgGenius test';

    return Scaffold(
      appBar: MainAppBar(
        title: homeTitle,
      ),
      body: _BodyContent(
        onOpenLinkPressed: () => _showWebViewBottomSheet(context),
      ),
    );
  }

  void _showWebViewBottomSheet(BuildContext context) {
    final String url = 'https://pub.dev/';
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => MainBottomSheetFactory.build(
        sheetArgs: WebViewArgs(
          url: url,
        ),
      ),
    );
  }
}
