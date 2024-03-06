import 'package:flutter/material.dart';

class SpotlightOverlayPainter extends CustomPainter {
  final Rect rect;
  final double? borderRadius;

  SpotlightOverlayPainter({required this.rect, this.borderRadius});

  @override
  void paint(Canvas canvas, Size size) {
    final overlayPaint = Paint()..color = Colors.black.withOpacity(0.7);
    final radius =
        borderRadius != null ? Radius.circular(borderRadius!) : Radius.zero;
    final rrect = RRect.fromRectAndRadius(rect, radius);

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
