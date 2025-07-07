import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    this.title = '',
    this.backgroundColor,
    super.key,
  });

  final String title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = TextTheme.of(context);

    return AppBar(
      backgroundColor: _getBackgroundColor(colorScheme),
      title: Text(
        title,
        style: textTheme.bodyLarge?.apply(
          color: colorScheme.onPrimary,
        ),
      ),
    );
  }

  Color _getBackgroundColor(ColorScheme colorScheme) =>
      backgroundColor ?? colorScheme.primary;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
