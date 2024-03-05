import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/spotlight_item.dart';

class SpotlightController extends ChangeNotifier {
  bool isActive = false;
  Widget? activeTooltip;
  List<GlobalKey> widgetKeys = [];

  int currentIndex = 0;

  void start(List<GlobalKey> keys) {
    widgetKeys = keys;
    isActive = true;
    currentIndex = 0;

    _updateActive();

    notifyListeners();
  }

  void dismiss() {
    widgetKeys = [];
    isActive = false;
    notifyListeners();
  }

  void next() {
    if (currentIndex < widgetKeys.length - 1) {
      currentIndex++;
      _updateActive();

      notifyListeners();
    }
  }

  void _updateActive() {
    final currentWidget = widgetKeys[currentIndex].currentWidget;
    if (currentWidget is SpotlightItem) {
      activeTooltip = currentWidget.tooltip(this);
    }
  }
}
