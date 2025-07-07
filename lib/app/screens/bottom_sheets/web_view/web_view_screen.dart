import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:proggenius_test/app/screens/bottom_sheets/web_view/bloc/web_view_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({
    required this.cubit,
    super.key,
  });

  final WebViewCubit cubit;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = widget.cubit.createWebViewController();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: _webViewController,
      gestureRecognizers: {
        Factory<VerticalDragGestureRecognizer>(
          () => VerticalDragGestureRecognizer(),
        )
      },
    );
  }
}
