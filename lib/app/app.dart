import 'package:flutter/material.dart';
import 'package:proggenius_test/app/screens/home/home_factory.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _getTheme(),
      home: HomeFactory.build(),
    );
  }

  ThemeData _getTheme() {
    final ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: Colors.green);
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
    );
  }
}
