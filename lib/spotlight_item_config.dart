import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/spotlight_controller.dart';

class SpotlightItemConfig {
  final Widget Function(SpotlightController) tooltip;
  final double? borderRadius;

  const SpotlightItemConfig({
    required this.tooltip,
    this.borderRadius,
  });
}
