import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/spotlight_controller.dart';

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
              // TODO: Add the spotlight painter
              // TODO: Add the spotlight tooltip here
              if (controller.activeTooltip != null) controller.activeTooltip!,
            ],
          );
        } else {
          return child;
        }
      },
    );
  }
}
