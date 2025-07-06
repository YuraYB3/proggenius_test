import 'package:flutter/cupertino.dart';
import 'package:proggenius_test/app/screens/bottom_sheets/main_bottom_sheet/main_bottom_sheet_screen.dart';

class MainBottomSheetFactory {
  static Widget build({
    dynamic sheetArgs,
  }) {
    return MainBottomSheetScreen(
      sheetArgs: sheetArgs,
    );
  }
}
