import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/nokta_game.dart';
import 'lines.dart';

bool isOverlapped;
List<Dot> clickedDots = List<Dot>();
List<Linex> lineList;

class Dot {
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


  // void initialize() {
  //   canvas2 = this.game.canvas;
  //   print("canvas2 initialization:");
  //   print(canvas2);
  // }

  Dot(this.game, double x, double y) {
    dotRect = Rect.fromCircle(center: Offset(x, y), radius: 10);
    dotRectx = RRect.fromRectXY(dotRect, 1000, 1000);
    dotPaint = Paint();
    dotPaint.color = Colors.transparent;
    this.x = x;
    this.y = y;
    Paint linexColor = Paint();
    linexColor.color = Colors.black;

    lineList = List<Linex>();

    void spawnLine() {
      lineList.add(Linex(this.game, Offset(newDotx.x, newDotx.y),
          Offset(oldDotx.x, oldDotx.y), linexColor));
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
    for (var k = 0; k < lineList.length; k++) {
      // lineList[k]
    }

    // void renderLine(Dot dot1, Dot dot2) {
    //   c.drawLine(Offset(dot1.x, dot1.y), Offset(dot2.x, dot2.y), dotPaint);
    // }
  }

  void update(double t) {
    // if (isDead) {
    //   dotRect = dotRect.translate(0, game.tileSize * 12 * t);
    // }
    lineList.forEach((Linex line) => line.update(t));
    // if (dotRect.top > game.screenSize.height) {
    //   isOffScreen = true;
    // }
  }

  void onTapDown(Dot dot) {
    newDotx = dot;
    // isDead = true;
    // game.spawnDot();

    // if player1
    // game.spawnDot();
    dotPaint.color = Colors.red;
    // paintArea(dot);
    radarColor.color = Colors.green.withOpacity(0.1);
    // else
    //dotPaint.color = Colors.blue;

    // dots.forEach((Dot dot) => isNewAreaFormed(dot));
    isNewAreaFormed(dot);

    clickedDots.add(dot);
    // print("x");
    // print(clickedDots.length);
  }

  // List isNewAreaFormed(Dot newDot) {
  //   var isNewAreaFormed = false;
  //   newDotx = newDot;
  //   for (var k = 0; k < clickedDots.length; k++) {
  //     if (newDot.radarRectx
  //         .contains(Offset((clickedDots[k]).x, (clickedDots[k]).y))) {
  //       print("contains");
  //       isNewAreaFormed = true;
  //       oldDotx = clickedDots[k];
  //     }
  //     isNewAreaFormed = false;
  //     oldDotx = newDot;
  //   }
  //   return [isNewAreaFormed, newDotx, oldDotx];
  //   // isOverlapped = Rect.overlaps();
  // }

  void isNewAreaFormed(Dot newDot) {
    Paint lineColor = Paint();
    lineColor.color = Colors.black;
    newDotx = newDot;
    for (var k = 0; k < clickedDots.length; k++) {
      if (newDot.radarRectx
          .contains(Offset((clickedDots[k]).x, (clickedDots[k]).y))) {
        print("contains");
        oldDotx = clickedDots[k];
        // render.renderLine(newDotx, oldDotx);
        print(Offset(newDotx.x, newDotx.y));
        print(Offset(oldDotx.x, oldDotx.y));
        print(dotPaint);
        print(this.game.canvas);

        lineList.add(Linex(this.game, Offset(newDotx.x, newDotx.y),
            Offset(oldDotx.x, oldDotx.y), lineColor));
      }
      oldDotx = newDot;
    }
  }

  void paintArea(Dot dot) {}
}
