import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/spotlight_item_config.dart';

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
