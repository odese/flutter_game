import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/nokta_game.dart';

class Dot {
  final NoktaGame game;
  Rect dotRect;
  RRect dotRectx;
  Paint dotPaint;

  Dot(this.game, double x, double y) {
    dotRect = Rect.fromCircle(center: Offset(x, y), radius: 10);
    dotRectx = RRect.fromRectXY(dotRect, 1000, 1000);
    dotPaint = Paint();
    dotPaint.color = Colors.transparent;
  }

  void render(Canvas c) {
    c.drawRRect(dotRectx, dotPaint);
  }

  void update(double t) {}

  void onTapDown() {
    // if player1
    dotPaint.color = Colors.red;
    // else
    //dotPaint.color = Colors.blue;
  }
}
