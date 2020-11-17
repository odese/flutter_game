import 'dart:ui';
import 'package:flutter/material.dart';

class Line {
  double x1, y1;
  double x2, y2;
  Paint paint = Paint();

  Line(double x1, y1, x2, y2, Paint paint) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.paint.color = paint.color;
  }

  renderLine(Canvas c, Line line) {
    Path path = Path();
    line.paint.style = PaintingStyle.stroke;
    line.paint.strokeWidth = 3;
    path.moveTo(line.x1, line.y1);
    path.lineTo(line.x2, line.y2);
    
    // path.fillType = PathFillType.nonZero;
    c.drawPath(path, line.paint);
    
    // c.drawLine(Offset(line.x1, line.y1), Offset(line.x2, line.y2), line.paint);
  }



}
