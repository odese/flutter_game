import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/nokta_game.dart';

class Dot {
  final NoktaGame game;
  Rect dotRect;
  RRect dotRectx;
  Paint dotPaint;
  bool isDead = false;
  bool isOffScreen = false;

  Dot(this.game, double x, double y) {
    // dotRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    dotRect = Rect.fromCircle(center: Offset(100, 100), radius: 10);
    dotRectx = RRect.fromRectXY(dotRect, 1000, 1000);
    dotPaint = Paint();
    dotPaint.color = Colors.red;
  }

  void render(Canvas c) {
    // c.drawRect(dotRect, dotPaint);
    c.drawRRect(dotRectx, dotPaint);
    // c.drawCircle(Offset(200, 200), 100, dotPaint);
    // c.drawCircle(Offset(200, 500), 100, dotPaint);
  }

  void update(double t) {
    // if (isDead) {
    //   dotRect = dotRect.translate(0, game.tileSize * 12 * t);
    // }
    // if (dotRect.top > game.screenSize.height) {
    //   isOffScreen = true;
    // }
  }

  void onTapDown() {
    // isDead = true;
    dotPaint.color = Colors.black;
    // game.spawnDot();
  }
}
