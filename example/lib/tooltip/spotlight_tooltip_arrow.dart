import 'package:flutter/material.dart';

enum SpotlightTooltipArrowDirection { up, down, none }

class SpotlightTooltipArrow extends StatelessWidget {
  final Offset? pointTo;
  final Color color;
  final double arrowHeight;
  final double arrowWidth;
  final bool pointUp;

  const SpotlightTooltipArrow({
    Key? key,
    required this.pointTo,
    required this.color,
    this.arrowHeight = 20,
    this.arrowWidth = 25,
    this.pointUp = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: _SpotlightTooltipArrowPainter(
          pointTo: pointTo,
          color: color,
          arrowHeight: arrowHeight,
          arrowWidth: arrowWidth,
          pointUp: pointUp),
    );
  }
}

class _SpotlightTooltipArrowPainter extends CustomPainter {
  final Offset? pointTo;
  final Color color;
  final double arrowHeight;
  final double arrowWidth;
  final bool pointUp;

  _SpotlightTooltipArrowPainter({
    required this.pointTo,
    required this.color,
    required this.arrowHeight,
    required this.arrowWidth,
    required this.pointUp,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();

    double pointX;
    double pointY;
    if (pointTo != null) {
      pointX = pointTo!.dx;
      pointY = pointTo!.dy;
    } else {
      pointX = arrowWidth / 2;
      pointY = arrowHeight / 2;
    }

    if (pointUp) {
      path.moveTo(pointX, pointY);
      path.lineTo(pointX + arrowWidth / 2, pointY + arrowHeight);
      path.lineTo(pointX - arrowWidth / 2, pointY + arrowHeight);
    } else {
      path.moveTo(pointX, pointY);
      path.lineTo(pointX + arrowWidth / 2, pointY - arrowHeight);
      path.lineTo(pointX - arrowWidth / 2, pointY - arrowHeight);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
