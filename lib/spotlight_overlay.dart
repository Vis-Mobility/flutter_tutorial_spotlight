import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/spotlight_overlay_painter.dart';

class SpotlightOverlay extends StatelessWidget {
  final GlobalKey targetKey;
  final double? borderRadius;

  const SpotlightOverlay({
    Key? key,
    required this.targetKey,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final RenderBox renderBox =
            targetKey.currentContext?.findRenderObject() as RenderBox;
        final offset = renderBox.localToGlobal(Offset.zero);
        final size = renderBox.size;

        return CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          painter: SpotlightOverlayPainter(
            rect: Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height),
            borderRadius: borderRadius,
          ),
        );
      },
    );
  }
}
