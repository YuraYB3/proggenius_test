import 'package:flutter/material.dart';
import 'package:proggenius_test/app/common/widgets/bottom_sheet/bottom_sheet_notch.dart';
import 'package:proggenius_test/app/screens/bottom_sheets/web_view/web_view_factory.dart';

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

  @override
  void initState() {
    super.initState();
    _draggableController.addListener(_onChanged);
  }

  void _onChanged() {
    final currentSize = _draggableController.size;
    if (currentSize <= 0.05) _collapse();
  }

  void _collapse() => _animateSheet(getSheet.snapSizes!.first);

  void _anchor() => _animateSheet(getSheet.snapSizes!.last);

  void _expand() => _animateSheet(getSheet.maxChildSize);

  void _hide() => _animateSheet(getSheet.minChildSize);

  void _animateSheet(double size) {
    _draggableController.animateTo(
      size,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _draggableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return DraggableScrollableSheet(
          key: _sheetKey,
          initialChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          minChildSize: 0,
          snap: true,
          snapSizes: getSnapSizes(constraints),
          controller: _draggableController,
          builder: (_, scrollController) {
            return DecoratedBox(
              decoration: getBottomSheetDecoration,
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: BottomSheetNotch(),
                  ),
                  SliverFillRemaining(
                    child: WebViewFactory.build(
                      widget.sheetArgs,
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  BoxDecoration get getBottomSheetDecoration => BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(26),
        ),
      );

  DraggableScrollableSheet get getSheet =>
      (_sheetKey.currentWidget as DraggableScrollableSheet);

  List<double> getSnapSizes(BoxConstraints constraints) => [
        60 / constraints.maxHeight,
        0.5,
      ];
}
