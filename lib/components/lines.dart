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
    ..style = PaintingStyle.stroke
    ..strokeWidth = 8;
  double x1;
  double y1;
  double x2;
  double y2;
  double length;

  Rect liner;
  var path = Path();

  Linex(this.game, double x1, double y1, double x2, double y2, Paint paint) {
    of1 = Offset(x1, y1);
    of2 = Offset(x2, y2);

    path = Path();
    path.moveTo(x1, y1);
    path.lineTo(x2, y2);

    path.fillType = PathFillType.evenOdd;
  }

  void render(Canvas c) {
    c.drawPath(path, pai);
  }

  void update(double t) {}
}
