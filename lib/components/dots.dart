import 'dart:ui';
import 'package:flutter_app/nokta_game.dart';

class Dot {
  NoktaGame game;
  Rect dotRect;
  Paint dotPaint;

  Dot(game, double x, double y) {
    dotRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    dotPaint = Paint();
    dotPaint.color = Color(0xff6ab04c);
  }

  void render(Canvas c) {
    c.drawRect(dotRect, dotPaint);
  }

  void update(double t) {}

}