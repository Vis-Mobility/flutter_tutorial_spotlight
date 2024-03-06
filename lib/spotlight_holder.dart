import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/enums.dart';
import 'package:tutorial_spotlight/spotlight_controller.dart';
import 'package:tutorial_spotlight/spotlight_item.dart';
import 'package:tutorial_spotlight/spotlight_overlay.dart';
import 'package:tutorial_spotlight/widget_position.dart';

class SpotlightHolder extends StatelessWidget {
  final SpotlightController controller;
  final Widget child;

  const SpotlightHolder({
    Key? key,
    required this.controller,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        if (controller.isActive) {
          return Stack(
            children: [
              child,
              SpotlightOverlay(
                targetKey: controller.currentKey,
                padding: controller.activeConfig?.padding,
                borderRadius: controller.activeConfig?.borderRadius,
              ),

              // TODO: Position the tooltip]
              if (controller.activeConfig != null)
                _buildTooltip(context, config: controller.activeConfig!),
            ],
          );
        } else {
          return child;
        }
      },
    );
  }

  Widget _buildTooltip(
    BuildContext context, {
    required SpotlightItemConfig config,
  }) {
    final tooltip = config.tooltip;
    final (offset, size) =
        WidgetPosition.getOffsetAndSize(controller.currentKey);
    double? left;
    double? top;
    double? right;
    double? bottom;

    final targetVerticalCenter = offset.dy + size.height / 2;
    final screenVerticalCenter = MediaQuery.of(context).size.height / 2;
    final isTop = config.tooltipVerticalPosition ==
            SpotlightTooltipVerticalPosition.top ||
        config.tooltipVerticalPosition ==
                SpotlightTooltipVerticalPosition.automatic &&
            targetVerticalCenter > screenVerticalCenter;

    final topPadding = config.padding.top;
    final bottomPadding = config.padding.bottom;
    if (isTop) {
      bottom = MediaQuery.of(context).size.height -
          offset.dy +
          topPadding +
          config.tooltipVerticalOffset;
    } else {
      top = offset.dy +
          size.height +
          bottomPadding +
          config.tooltipVerticalOffset;
    }

    switch (config.tooltipHorizontalPosition) {
      case SpotlightTooltipHorizontalPosition.alignLeft:
        left = offset.dx - config.tooltipHorizontalOffset;
      case SpotlightTooltipHorizontalPosition.alignRight:
        right = MediaQuery.of(context).size.width -
            size.width -
            offset.dx -
            config.tooltipHorizontalOffset;
      case SpotlightTooltipHorizontalPosition.center:
        left = config.tooltipHorizontalOffset;
        right = left;
    }

    final pointTo = Offset(
      offset.dx + size.width / 2,
      isTop ? offset.dy - topPadding : offset.dy + size.height + bottomPadding,
    );

    final SpotlightTooltipPosition tooltipPosition = SpotlightTooltipPosition(
      pointTo: pointTo,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );

    return tooltip(controller, tooltipPosition);
  }
}
