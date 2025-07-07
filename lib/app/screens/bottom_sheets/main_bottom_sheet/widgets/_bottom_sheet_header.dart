part of '../main_bottom_sheet_screen.dart';

class _BottomSheetHeaderDelegate extends SliverPersistentHeaderDelegate {
  _BottomSheetHeaderDelegate({
    required this.iconNotifier,
    required this.onIconPressed,
    required this.collapsedThreshold,
  });

  final ValueNotifier<double> iconNotifier;
  final VoidCallback onIconPressed;
  final double collapsedThreshold;

  @override
  double get minExtent => 30;

  @override
  double get maxExtent => 30;

  @override
  Widget build(BuildContext context, _, __) {
    return Flexible(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 10,
              ),
              child: _ActionButton(
                iconNotifier: iconNotifier,
                onIconPressed: onIconPressed,
                collapsedThreshold: collapsedThreshold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 20,
            ),
            child: const _Notch(),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_) => false;
}
