import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/spotlight_controller.dart';

class SpotlightItem extends StatelessWidget {
  final Widget Function(SpotlightController) tooltip;
  final Widget child;

  const SpotlightItem({
    Key? key,
    required this.tooltip,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
