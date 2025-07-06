import 'package:proggenius_test/app/domain/handlers/iweb_view_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewHandler implements IWebViewHandler {
  @override
  WebViewController createController({
    required String url,
    JavaScriptMode mode = JavaScriptMode.unrestricted,
  }) {
    return WebViewController()
      ..setJavaScriptMode(mode)
      ..loadRequest(
        Uri.parse(
          url,
        ),
      );
  }
}
