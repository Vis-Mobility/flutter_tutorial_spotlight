import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/spotlight_overlay_painter.dart';
import 'package:tutorial_spotlight/widget_position.dart';

class SpotlightOverlay extends StatelessWidget {
  final GlobalKey targetKey;
  final EdgeInsets? padding;
  final double? borderRadius;

  const SpotlightOverlay({
    Key? key,
    required this.targetKey,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final (offset, size) = WidgetPosition.getOffsetAndSize(targetKey);

        return CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          painter: SpotlightOverlayPainter(
            rect: Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height),
            padding: padding,
            borderRadius: borderRadius,
          ),
        );
      },
    );
  }
}
