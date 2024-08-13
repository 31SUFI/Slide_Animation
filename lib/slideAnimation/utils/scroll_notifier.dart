// slide_animation/utils/scroll_notifier.dart
import 'package:flutter/material.dart';

class ScrollNotifier {
  final PageController pageController;
  final ValueNotifier<double> notifierScroll;

  ScrollNotifier(this.pageController, this.notifierScroll);

  void listener() {
    notifierScroll.value = pageController.page!;
  }

  void addListener() {
    pageController.addListener(listener);
  }

  void removeListener() {
    pageController.removeListener(listener);
  }
}
