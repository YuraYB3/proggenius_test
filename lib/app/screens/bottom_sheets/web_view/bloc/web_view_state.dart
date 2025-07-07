import 'package:equatable/equatable.dart';

class WebViewState extends Equatable {
  const WebViewState({this.isPageLoading = true});

  final bool isPageLoading;

  WebViewState copyWith({
    bool? isPageLoading,
  }) {
    return WebViewState(
      isPageLoading: isPageLoading ?? this.isPageLoading,
    );
  }

  @override
  List<Object?> get props => [isPageLoading];
}
