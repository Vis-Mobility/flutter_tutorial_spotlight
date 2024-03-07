import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/src/enums.dart';
import 'package:tutorial_spotlight/src/spotlight_controller.dart';

class SpotlightItemConfig {
  /// The tooltip widget to be displayed when the spotlight is active
  final Widget Function(SpotlightController, SpotlightTooltipPosition) tooltip;

  /// The padding to be applied to the spotlight item when painting the overlay
  ///
  /// Default to [EdgeInsets.zero]
  final EdgeInsets padding;

  /// The border radius to be applied to the spotlight item when painting the overlay
  /// A [double] value that represents the radius of the corners of the rectangle
  ///
  /// Default to `0.0`
  final double borderRadius;

  /// The [SpotlightTooltipVerticalPosition] of the tooltip.
  ///
  /// Default to [SpotlightTooltipVerticalPosition.automatic]
  final SpotlightTooltipVerticalPosition tooltipVerticalPosition;

  /// The vertical offset to be applied to the tooltip.
  /// A [double] value that represents the distance from the top or bottom of the spotlight item.
  /// If [tooltipVerticalPosition] resolves to [SpotlightTooltipVerticalPosition.top],
  /// the offset will be applied from the top.
  /// If [tooltipVerticalPosition] resolves to [SpotlightTooltipVerticalPosition.bottom],
  /// the offset will be applied from the bottom.
  ///
  /// Default to `0.0`
  final double tooltipVerticalOffset;

  /// The [SpotlightTooltipHorizontalPosition] of the tooltip.
  ///
  /// Default to [SpotlightTooltipHorizontalPosition.center]
  final SpotlightTooltipHorizontalPosition tooltipHorizontalPosition;

  /// The horizontal offset to be applied to the tooltip.
  /// A [double] value that represents the distance to horizontally move the
  /// tooltip from the original position as determined by [tooltipHorizontalPosition].
  ///
  /// Default to `0.0`
  final double tooltipHorizontalOffset;

  /// Whether to show a spotlight for the item. If `false` the overlay will be
  /// painted without the spotlight.
  ///
  /// Default to `true`
  final bool showSpotlight;

  final Function()? onNext;

  final Function()? onDismiss;

  const SpotlightItemConfig({
    required this.tooltip,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 0.0,
    this.tooltipVerticalPosition = SpotlightTooltipVerticalPosition.automatic,
    this.tooltipVerticalOffset = 0.0,
    this.tooltipHorizontalPosition = SpotlightTooltipHorizontalPosition.center,
    this.tooltipHorizontalOffset = 0.0,
    this.showSpotlight = true,
    this.onNext,
    this.onDismiss,
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
