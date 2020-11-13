import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/nokta_game.dart';

class Dot {
  final NoktaGame game;
  Rect dotRect;
  Rect areaRect;
  Paint areaColor;
  RRect dotRectx;
  RRect areaRectx;
  Paint dotPaint;
  double x;
  double y;


  Dot(this.game, double x, double y) {
    dotRect = Rect.fromCircle(center: Offset(x, y), radius: 10);
    dotRectx = RRect.fromRectXY(dotRect, 1000, 1000);
    dotPaint = Paint();
    dotPaint.color = Colors.transparent;
    this.x = x;
    this.y = y;

    double rad;
    rad = 50*sqrt(2).toDouble();
    areaRect = Rect.fromCircle(center: Offset(this.x, this.y), radius: rad);
    areaRectx = RRect.fromRectXY(areaRect, 1000, 1000);
    areaColor = Paint();
    areaColor.color = Colors.transparent;
  }

  void render(Canvas c) {
    c.drawRRect(dotRectx, dotPaint);
    c.drawRRect(areaRectx, areaColor);
  }

  void update(double t) {}

  void onTapDown(Dot dot) {
    // if player1
    // game.spawnDot();
    dotPaint.color = Colors.red;
    // paintArea(dot);
    areaColor.color = Colors.green.withOpacity(0.5);
    // else
    //dotPaint.color = Colors.blue;
  }

  void paintArea(Dot dot) {

  }
}
