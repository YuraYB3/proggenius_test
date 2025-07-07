part of '../main_bottom_sheet_screen.dart';

class _Notch extends StatelessWidget {
  const _Notch({
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
