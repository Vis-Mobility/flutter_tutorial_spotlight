import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/src/spotlight_overlay_painter.dart';
import 'package:tutorial_spotlight/src/widget_position.dart';

class SpotlightOverlay extends StatelessWidget {
  final GlobalKey targetKey;
  final EdgeInsets? padding;
  final double? borderRadius;
  final bool showSpotlight;
  final Color? overlayColor;

  const SpotlightOverlay({
    Key? key,
    required this.targetKey,
    this.padding,
    this.borderRadius,
    required this.showSpotlight,
    this.overlayColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Offset offset;
        Size size;

        if (showSpotlight) {
          (offset, size) = WidgetPosition.getOffsetAndSize(targetKey);
        } else {
          offset = Offset.zero;
          size = Size.zero;
        }

        return CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          painter: SpotlightOverlayPainter(
            rect: Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height),
            padding: padding,
            borderRadius: borderRadius,
            overlayColor: overlayColor,
          ),
        );
      },
    );
  }
}
