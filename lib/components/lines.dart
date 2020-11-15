import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/nokta_game.dart';

class Linex {
  final NoktaGame game;
  Linex line;
  Offset of1;
  Offset of2;
  Paint pai = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.fill;
  // ..strokeWidth = 8;
  double x1;
  double y1;
  double x2;
  double y2;
  double length;

  Rect liner;
  var path = Path();
  // Path path;

  Linex(this.game, double x1, double y1, double x2, double y2, Paint paint) {
    of1 = Offset(x1, y1);
    of2 = Offset(x2, y2);
    // of1 = offset1;
    // of2 = offset2;
    // pai = Paint();
    // pai = paint;
    // pai.style = PaintingStyle.fill;

    path = Path();
    path.moveTo(x1, y1);
    path.lineTo(x2, y2);
    // liner = Rect.
    // print(path);
    path.fillType = PathFillType.evenOdd;
  }

  void render(Canvas c) {
    // c.drawLine(of1, of2, pai);
    c.drawPath(path, pai);
    // if (path.fillType)
  }

  void update(double t) {}
}
