import 'package:flutter/material.dart';

enum SpotlightTooltipArrowDirection { up, down, none }

class SpotlightTooltipArrow extends StatelessWidget {
  final Offset? pointTo;
  final SpotlightTooltipArrowDirection direction;
  final Color color;
  final double arrowHeight;
  final double arrowWidth;

  const SpotlightTooltipArrow({
    Key? key,
    required this.pointTo,
    required this.direction,
    required this.color,
    this.arrowHeight = 20,
    this.arrowWidth = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: _SpotlightTooltipArrowPainter(
        pointTo: pointTo,
        direction: direction,
        color: color,
        arrowHeight: arrowHeight,
        arrowWidth: arrowWidth,
      ),
    );
  }
}

class _SpotlightTooltipArrowPainter extends CustomPainter {
  final Offset? pointTo;
  final SpotlightTooltipArrowDirection direction;
  final Color color;
  final double arrowHeight;
  final double arrowWidth;

  _SpotlightTooltipArrowPainter({
    required this.pointTo,
    required this.direction,
    required this.color,
    required this.arrowHeight,
    required this.arrowWidth,
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

    switch (direction) {
      case SpotlightTooltipArrowDirection.up:
        path.moveTo(pointX, pointY);
        path.lineTo(pointX + arrowWidth / 2, pointY + arrowHeight);
        path.lineTo(pointX - arrowWidth / 2, pointY + arrowHeight);
        break;
      case SpotlightTooltipArrowDirection.down:
        path.moveTo(pointX, pointY);
        path.lineTo(pointX + arrowWidth / 2, pointY - arrowHeight);
        path.lineTo(pointX - arrowWidth / 2, pointY - arrowHeight);
        break;
      case SpotlightTooltipArrowDirection.none:
        break;
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
