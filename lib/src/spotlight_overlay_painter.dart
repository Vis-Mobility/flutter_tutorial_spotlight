import 'package:flutter/material.dart';

class SpotlightOverlayPainter extends CustomPainter {
  final Rect rect;
  final EdgeInsets? padding;
  final double? borderRadius;
  final Color? overlayColor;

  SpotlightOverlayPainter(
      {required this.rect, this.padding, this.borderRadius, this.overlayColor});

  @override
  void paint(Canvas canvas, Size size) {
    final overlayPaint = Paint()
      ..color = overlayColor ?? Colors.black.withOpacity(0.7);
    final radius =
        borderRadius != null ? Radius.circular(borderRadius!) : Radius.zero;
    final edgeInsets = padding != null ? padding! : EdgeInsets.zero;

    final paddedRect = Rect.fromLTWH(
      rect.left - edgeInsets.left,
      rect.top - edgeInsets.top,
      rect.width + edgeInsets.horizontal,
      rect.height + edgeInsets.vertical,
    );

    final rrect = RRect.fromRectAndRadius(paddedRect, radius);

    final spotlightPaint = Paint()..blendMode = BlendMode.clear;

    canvas.saveLayer(Offset.zero & size, Paint());
    canvas.drawRect(Offset.zero & size, overlayPaint);
    canvas.drawRRect(rrect, spotlightPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(SpotlightOverlayPainter oldDelegate) {
    return rect != oldDelegate.rect;
  }
}
