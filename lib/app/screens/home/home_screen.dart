import 'package:flutter/material.dart';
import 'package:proggenius_test/app/common/widgets/main_app_bar.dart';

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
      appBar: MainAppBar(title: homeTitle),
      body: _BodyContent(
        onOpenLinkPressed: () {},
      ),
    );
  }
}
