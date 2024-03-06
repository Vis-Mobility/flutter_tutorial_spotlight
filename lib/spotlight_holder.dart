import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/spotlight_controller.dart';
import 'package:tutorial_spotlight/spotlight_overlay.dart';

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
                borderRadius: controller.activeConfig?.borderRadius,
              ),

              // TODO: Position the tooltip
              if (controller.activeConfig?.tooltip != null)
                controller.activeConfig!.tooltip(controller),
            ],
          );
        } else {
          return child;
        }
      },
    );
  }
}
