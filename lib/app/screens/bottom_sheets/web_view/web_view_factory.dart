import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proggenius_test/app/domain/handlers/iweb_view_handler.dart';
import 'package:proggenius_test/app/screens/bottom_sheets/web_view/bloc/web_view_cubit.dart';
import 'package:proggenius_test/app/screens/bottom_sheets/web_view/web_view_screen.dart';
import 'package:proggenius_test/app/utils/service_locator.dart';

class WebViewArgs {
  const WebViewArgs({
    required this.url,
  });

  final String url;
}

class WebViewFactory {
  static Widget build(WebViewArgs args) {
    return BlocProvider(
      create: (_) => WebViewCubit(
        url: args.url,
        iWebViewHandler: sl.get<IWebViewHandler>(),
      ),
      child: Builder(
        builder: (BuildContext context) {
          return WebViewScreen(
            cubit: BlocProvider.of<WebViewCubit>(context),
          );
        },
      ),
    );
  }
}
