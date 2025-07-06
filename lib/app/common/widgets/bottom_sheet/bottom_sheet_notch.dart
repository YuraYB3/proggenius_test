import 'package:flutter/material.dart';

class BottomSheetNotch extends StatelessWidget {
  const BottomSheetNotch({
    this.notchWidth = 36,
    this.notchHeight = 4,
    super.key,
  });

  final double notchWidth;
  final double notchHeight;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color notchColor = colorScheme.primaryFixedDim.withValues(alpha: 0.4);

    return Center(
      child: Container(
        margin: const EdgeInsetsDirectional.only(top: 8),
        width: notchWidth,
        height: notchHeight,
        decoration: BoxDecoration(
          color: notchColor,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
