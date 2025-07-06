import 'package:get_it/get_it.dart';
import 'package:proggenius_test/app/domain/handlers/iweb_view_handler.dart';
import 'package:proggenius_test/app/handlers/web_view_handler.dart';

final GetIt sl = GetIt.instance;

class ServiceLocator {
  void initHandlers() {
    sl.registerFactory<IWebViewHandler>(() => WebViewHandler());
  }
}
