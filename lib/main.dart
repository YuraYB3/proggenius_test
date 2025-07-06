import 'package:flutter/material.dart';
import 'package:proggenius_test/app/app.dart';
import 'package:proggenius_test/app/utils/service_locator.dart';

void main() {
  final ServiceLocator slFactory = ServiceLocator();
  slFactory.initHandlers();
  runApp(
    const MyApp(),
  );
}
