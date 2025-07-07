import 'package:proggenius_test/app/domain/handlers/iweb_view_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'web_view_state.dart';

class WebViewCubit extends Cubit<WebViewState> {
  WebViewCubit({
    required String url,
    required IWebViewHandler iWebViewHandler,
  })  : _url = url,
        _iWebViewHandler = iWebViewHandler,
        super(
          WebViewState(),
        );

  final String _url;
  final IWebViewHandler _iWebViewHandler;

  WebViewController createWebViewController() =>
      _iWebViewHandler.createController(url: _url);

  void updateLoadingStatus({required bool isLoading}) {
    if (isLoading == state.isPageLoading) return;

    emit(state.copyWith(isPageLoading: isLoading));
  }
}
