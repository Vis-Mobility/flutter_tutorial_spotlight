import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/enums.dart';
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
  final Widget Function(SpotlightController, SpotlightTooltipPosition) tooltip;
  final EdgeInsets padding;
  final double borderRadius;
  final SpotlightTooltipVerticalPosition tooltipVerticalPosition;
  final double tooltipVerticalOffset;
  final SpotlightTooltipHorizontalPosition tooltipHorizontalPosition;
  final double tooltipHorizontalOffset;

  const SpotlightItemConfig({
    required this.tooltip,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 0.0,
    this.tooltipVerticalPosition = SpotlightTooltipVerticalPosition.automatic,
    this.tooltipVerticalOffset = 0,
    this.tooltipHorizontalPosition = SpotlightTooltipHorizontalPosition.center,
    this.tooltipHorizontalOffset = 0,
  });
}

class SpotlightTooltipPosition {
  final Offset? pointTo;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;

  const SpotlightTooltipPosition({
    this.pointTo,
    this.left,
    this.top,
    this.right,
    this.bottom,
  });
}
