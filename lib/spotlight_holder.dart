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

    if (isTop) {
      bottom = MediaQuery.of(context).size.height - offset.dy;
    } else {
      final bottomPadding = config.padding?.bottom ?? 0;
      top = offset.dy + size.height + bottomPadding;
    }

    switch (config.tooltipHorizontalPosition) {
      case SpotlightTooltipHorizontalPosition.alignLeft:
        left = offset.dx;
      case SpotlightTooltipHorizontalPosition.alignRight:
        right = MediaQuery.of(context).size.width - size.width - offset.dx;
      case SpotlightTooltipHorizontalPosition.center:
        left = 0;
        right = 0;
    }

    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: Center(child: tooltip(controller)),
    );
  }
}
