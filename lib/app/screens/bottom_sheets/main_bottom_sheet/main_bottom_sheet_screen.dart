import 'package:flutter/material.dart';
import 'package:proggenius_test/app/screens/bottom_sheets/web_view/web_view_factory.dart';

part 'widgets/_bottom_sheet_header.dart';

part 'widgets/_action_button.dart';

part 'widgets/_notch.dart';

const double _initialSize = 0.5;

class MainBottomSheetScreen extends StatefulWidget {
  const MainBottomSheetScreen({
    required this.sheetArgs,
    super.key,
  });

  final dynamic sheetArgs;

  @override
  State<MainBottomSheetScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<MainBottomSheetScreen> {
  final GlobalKey _sheetKey = GlobalKey();
  final DraggableScrollableController _draggableController =
      DraggableScrollableController();
  final ValueNotifier<double> _currentSizeNotifier =
      ValueNotifier(_initialSize);

  @override
  void initState() {
    super.initState();
    _draggableController.addListener(_onChanged);
  }

  void _onChanged() {
    _currentSizeNotifier.value = _draggableController.size;
  }

  void _collapse() => _animateSheet(_getSheet.snapSizes!.first);

  void _close() => Navigator.of(context).maybePop();

  void _expand() => _animateSheet(_getSheet.maxChildSize);

  void _animateSheet(double size) {
    const Duration animationDuration = Duration(milliseconds: 50);
    _draggableController.animateTo(
      size,
      duration: animationDuration,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _draggableController.removeListener(_onChanged);
    _draggableController.dispose();
    _currentSizeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double buttonPadding = MediaQuery.viewInsetsOf(context).bottom;
    final bool isKeyboardVisible = buttonPadding != 0;

    if (isKeyboardVisible) {
      _expand();
    }

    return LayoutBuilder(
      builder: (_, constraints) {
        final List<double> snapSizes = _getSnapSizes(constraints);
        final double collapsedThreshold = snapSizes.first;

        return DraggableScrollableSheet(
          key: _sheetKey,
          maxChildSize: 0.95,
          expand: false,
          minChildSize: 0,
          initialChildSize: _initialSize,
          snap: true,
          snapSizes: snapSizes,
          controller: _draggableController,
          builder: (_, scrollController) {
            return DecoratedBox(
              decoration: _getBottomSheetDecoration,
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _BottomSheetHeaderDelegate(
                      iconNotifier: _currentSizeNotifier,
                      onIconPressed: _onIconPressed,
                      collapsedThreshold: collapsedThreshold,
                    ),
                  ),
                  SliverFillRemaining(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(top: 32),
                      child: WebViewFactory.build(
                        widget.sheetArgs,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  BoxDecoration get _getBottomSheetDecoration => BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(26),
        ),
      );

  DraggableScrollableSheet get _getSheet =>
      (_sheetKey.currentWidget as DraggableScrollableSheet);

  List<double> _getSnapSizes(BoxConstraints constraints) => [
        56 / constraints.maxHeight,
        0.5,
      ];

  void _onIconPressed() {
    if (_currentSizeNotifier.value > _getSheet.snapSizes!.first) {
      _collapse();
    } else {
      _close();
    }
  }
}
