import 'package:flutter/material.dart';

final model = PageCounterViewModel.init();

class PageCounterViewModel extends ChangeNotifier {
  int pageCount;

  PageCounterViewModel({required this.pageCount});

  factory PageCounterViewModel.init() {
    return PageCounterViewModel(pageCount: 0);
  }

  void changePageCount(int pageViewIndex) {
    pageCount = pageViewIndex;
    notifyListeners();
  }
}

class PageCounterProvider extends InheritedNotifier<PageCounterViewModel> {
  final PageCounterViewModel model;

  const PageCounterProvider({
    super.key,
    required this.model,
    required super.child,
  }) : super(notifier: model);

  static PageCounterViewModel? of(BuildContext context) {
    final model = context
        .dependOnInheritedWidgetOfExactType<PageCounterProvider>()
        ?.model;

    return model;
  }
}