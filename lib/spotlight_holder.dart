import 'package:flutter/material.dart';
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

    switch (config.tooltipVerticalPosition) {
      case SpotlightTooltipVerticalPosition.top:
        return _buildTooltipTop(
          context,
          tooltip: tooltip,
          padding: config.padding,
          offset: offset,
          size: size,
        );
      case SpotlightTooltipVerticalPosition.bottom:
        return _buildTooltipBottom(
          tooltip: tooltip,
          padding: config.padding,
          offset: offset,
          size: size,
        );
      case SpotlightTooltipVerticalPosition.automatic:
        return _buildTooltipAutomatic(
          context,
          tooltip: tooltip,
          offset: offset,
          size: size,
        );
    }
  }

  Widget _buildTooltipTop(
    BuildContext context, {
    required Widget Function(SpotlightController) tooltip,
    EdgeInsets? padding,
    required Offset offset,
    required Size size,
  }) {
    final bottom = MediaQuery.of(context).size.height - offset.dy;
    return Positioned(
      left: offset.dx,
      bottom: bottom,
      child: tooltip(controller),
    );
  }

  Widget _buildTooltipBottom({
    required Widget Function(SpotlightController) tooltip,
    EdgeInsets? padding,
    required Offset offset,
    required Size size,
  }) {
    final tooltipPosition = Offset(offset.dx, offset.dy + size.height);

    return Positioned(
      top: tooltipPosition.dy,
      left: tooltipPosition.dx,
      child: tooltip(controller),
    );
  }

  Widget _buildTooltipAutomatic(
    BuildContext context, {
    required Widget Function(SpotlightController) tooltip,
    EdgeInsets? padding,
    required Offset offset,
    required Size size,
  }) {
    final targetVerticalCenter = offset.dy + size.height / 2;
    final screenVerticalCenter = MediaQuery.of(context).size.height / 2;

    if (targetVerticalCenter > screenVerticalCenter) {
      return _buildTooltipTop(
        context,
        tooltip: tooltip,
        padding: padding,
        offset: offset,
        size: size,
      );
    } else {
      return _buildTooltipBottom(
        tooltip: tooltip,
        padding: padding,
        offset: offset,
        size: size,
      );
    }
  }
}
