import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class Dot {
  double x;
  double y;
  Paint paint;
  bool isClicked;

  Dot(double x, y, Paint paint, bool isClicked) {
    this.x = x;
    this.y = y;
    this.paint = paint;
    this.isClicked = isClicked;
  }

  void onTapDown(Dot dot) {
    dot.isClicked = true;
    // if player1
    dot.paint.color = Colors.red;
    // else
    //dotPaint.color = Colors.blue;
  }

  renderDot(Canvas c, Dot dot) {
    c.drawCircle(Offset(dot.x, dot.y), 10, dot.paint);
  }

  // Creates and returns radar for a dot
  radar(Dot dot) {
    double rad = 50 * sqrt(2).toDouble();
    Rect radarRect = Rect.fromCircle(center: Offset(dot.x, dot.y), radius: rad);
    RRect radar = RRect.fromRectAndRadius(radarRect, Radius.circular(rad));
    return radar;
  }

  // To test radar
  drawRadar(Canvas canvas, RRect radar) {
    Paint color = Paint();
    color.color = Colors.green.withOpacity(0.1);
    canvas.drawRRect(radar, color);
  }

  // Creates and returns radar for a dot
  hitBox(Dot dot) {
    Rect hitBox = Rect.fromCircle(center: Offset(dot.x, dot.y), radius: 25);
    return hitBox;
  }

  // To test hitBox
  drawHitBox(Canvas canvas, Rect hitBox) {
    Paint color = Paint();
    color.color = Colors.amberAccent.withOpacity(0.1);
    canvas.drawRect(hitBox, color);
  }
}
