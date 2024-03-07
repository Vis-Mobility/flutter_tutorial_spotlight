import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/spotlight_item.dart';

class SpotlightController extends ChangeNotifier {
  bool isActive = false;
  SpotlightItemConfig? activeConfig;
  List<GlobalKey> widgetKeys = [];
  final Function()? onStart;
  final Function()? onDone;

  SpotlightController({this.onStart, this.onDone});

  int currentIndex = 0;

  GlobalKey get currentKey => widgetKeys[currentIndex];

  void start(List<GlobalKey> keys) {
    widgetKeys = keys;
    isActive = true;
    currentIndex = 0;

    _updateActive();

    onStart?.call();

    notifyListeners();
  }

  void dismiss() {
    _cleanup();
    activeConfig?.onDismiss?.call();
  }

  void next() {
    if (currentIndex < widgetKeys.length - 1) {
      currentIndex++;
      activeConfig?.onNext?.call();
      _updateActive();

      notifyListeners();
    } else {
      _cleanup();
      onDone?.call();
    }
  }

  void _cleanup() {
    widgetKeys = [];
    isActive = false;
    notifyListeners();
  }

  void _updateActive() {
    final currentWidget = widgetKeys[currentIndex].currentWidget;
    if (currentWidget is SpotlightItem) {
      activeConfig = currentWidget.config;
    }
  }
}
