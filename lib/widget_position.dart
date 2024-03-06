import 'package:flutter/material.dart';

class WidgetPosition {
  static RenderBox getRenderBox(GlobalKey targetKey) {
    return targetKey.currentContext?.findRenderObject() as RenderBox;
  }

  static (Offset, Size) getOffsetAndSize(GlobalKey targetKey) {
    final renderBox = getRenderBox(targetKey);
    return (renderBox.localToGlobal(Offset.zero), renderBox.size);
  }
}
