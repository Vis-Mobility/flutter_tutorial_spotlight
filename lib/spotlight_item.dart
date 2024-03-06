import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/spotlight_controller.dart';

class SpotlightItem extends StatelessWidget {
  final SpotlightItemConfig config;
  final Widget child;

  const SpotlightItem({
    Key? key,
    required this.config,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class SpotlightItemConfig {
  final Widget Function(SpotlightController) tooltip;
  final EdgeInsets? padding;
  final double? borderRadius;
  final SpotlightTooltipVerticalPosition tooltipVerticalPosition;

  const SpotlightItemConfig({
    required this.tooltip,
    this.padding,
    this.borderRadius,
    this.tooltipVerticalPosition = SpotlightTooltipVerticalPosition.automatic,
  });
}

enum SpotlightTooltipVerticalPosition { top, bottom, automatic }
