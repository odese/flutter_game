import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/nokta_game.dart';
import 'lines.dart';

bool isOverlapped;
List<Dot> clickedDots = List<Dot>();
List<Linex> lineList;

class Dot {
  String name;
  Dot newDotx;
  Dot oldDotx;
  final NoktaGame game;
  Rect dotRect;
  Rect radarRect;
  Paint radarColor;
  RRect dotRectx;
  RRect radarRectx;
  Paint dotPaint;
  double x;
  double y;
  bool isDead = false;
  bool isOffScreen = false;
  List<Dot> dots;

  double x1;
  double y1;
  double x2;
  double y2;

  Dot(this.game, double x, double y) {
    dotPaint = Paint();
    dotPaint.color = Colors.transparent;
    name = x.toString() + "-" + y.toString();
    dotRect = Rect.fromCircle(center: Offset(x, y), radius: 10);
    dotRectx = RRect.fromRectXY(dotRect, 1000, 1000);

    this.x = x;
    this.y = y;
    Paint linexColor = Paint();
    linexColor.color = Colors.black;

    lineList = List<Linex>();

    void spawnLine() {
      x1 = newDotx.x;
      y1 = newDotx.y;
      x2 = oldDotx.x;
      y2 = oldDotx.y;

      lineList.add(Linex(this.game, x1, y1, x2, y2, linexColor));
    }

    void initialize() async {
      lineList = List<Linex>();
      spawnLine();
    }

    Dot(game, x, y) {
      initialize();
    }

    double rad;
    rad = 50 * sqrt(2).toDouble();
    radarRect = Rect.fromCircle(center: Offset(this.x, this.y), radius: rad);
    radarRectx = RRect.fromRectXY(radarRect, 1000, 1000);
    radarColor = Paint();
    radarColor.color = Colors.transparent;
  }

  void render(Canvas c) {
    c.drawRRect(dotRectx, dotPaint);
    c.drawRRect(radarRectx, radarColor);

    lineList.forEach((Linex line) => line.render(c));
    for (var k = 0; k < lineList.length; k++) {}
  }

  void update(double t) {
    lineList.forEach((Linex line) => line.update(t));
  }

  void onTapDown(Dot dot) {
    newDotx = dot;

    dotPaint.color = Colors.red;

    radarColor.color = Colors.green.withOpacity(0.1);

    isNewAreaFormed(dot);

    clickedDots.add(dot);
    name = name + "-" + dotPaint.color.toString();
    print(name);
  }

  void isNewAreaFormed(Dot newDot) {
    Paint lineColor = Paint();
    lineColor.color = Colors.black;
    newDotx = newDot;
    for (var k = 0; k < clickedDots.length; k++) {
      if (newDot.radarRectx
          .contains(Offset((clickedDots[k]).x, (clickedDots[k]).y))) {
        oldDotx = clickedDots[k];
        x1 = newDotx.x;
        y1 = newDotx.y;
        x2 = oldDotx.x;
        y2 = oldDotx.y;
        lineList.add(Linex(this.game, x1, y1, x2, y2, lineColor));
      }
      oldDotx = newDot;
    }
  }

  void paintArea(Dot dot) {}
}
