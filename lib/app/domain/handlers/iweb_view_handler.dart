import 'package:webview_flutter/webview_flutter.dart';

abstract interface class IWebViewHandler {
  WebViewController createController({
    required String url,
    JavaScriptMode mode = JavaScriptMode.unrestricted,
  });
}
