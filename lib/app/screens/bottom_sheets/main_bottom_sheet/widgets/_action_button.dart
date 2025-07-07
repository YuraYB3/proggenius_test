part of '../main_bottom_sheet_screen.dart';

const double _kEpsilon = 0.0001;

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.iconNotifier,
    required this.onIconPressed,
    required this.collapsedThreshold,
    super.key,
  });

  final ValueNotifier<double> iconNotifier;
  final VoidCallback onIconPressed;
  final double collapsedThreshold;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ValueListenableBuilder<double>(
      valueListenable: iconNotifier,
      builder: (_, currentSize, __) {
        final IconData icon = _getIcon(_isCollapsed(currentSize));

        return IconButton(
          icon: Icon(
            icon,
            color: colorScheme.primary,
            size: 32,
          ),
          onPressed: onIconPressed,
        );
      },
    );
  }

  bool _isCollapsed(double currentSize) =>
      currentSize > (collapsedThreshold + _kEpsilon);

  IconData _getIcon(bool isCollapsed) =>
      isCollapsed ? Icons.keyboard_arrow_down : Icons.close;
}
