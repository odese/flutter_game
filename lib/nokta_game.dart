
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter_app/components/dots.dart';

class NoktaGame extends Game {
  Size screenSize;
  double tileSize;
  List<Dot> dots;
  bool hasWon;

  NoktaGame() {
    initialize();
  }

  void initialize() async {
    dots = List<Dot>();
    resize(await Flame.util.initialDimensions());
    // en başta şeffaf noktalar construct edip sonrasında, spawnDot yerine colorDot methodunu çağırabiliriz.
    spawnDot();
  }

  void render(Canvas canvas) {

    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Colors.white70;
    canvas.drawRect(bgRect, bgPaint);

    Paint linePaint = Paint();
    linePaint.color = Colors.blueAccent;
    for (var i = 0; i < 500; i=i+50) {
      canvas.drawLine(Offset(i.toDouble(),0), Offset(i.toDouble(),1000), linePaint);
    }
    for (var j = 0; j < 1500; j=j+50) {
      canvas.drawLine(Offset(0,j.toDouble()), Offset(1000,j.toDouble()), linePaint);
    }

    dots.forEach((Dot dot) => dot.render(canvas));

  }

  void spawnDot() {
    dots.add(Dot(this, 50, 50));
  }

  void onTapDown(TapDownDetails d) {
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    if (d.globalPosition.dx >= screenCenterX - 75
        && d.globalPosition.dx <= screenCenterX + 75
        && d.globalPosition.dy >= screenCenterY - 75
        && d.globalPosition.dy <= screenCenterY + 75
    ) {
      hasWon = true;
    }
  }

  void update(double t) {
    // TODO: implement update
    dots.forEach((Dot dot) => dot.update(t));
  }

  void resize(Size size) {
    screenSize = size;
    super.resize(size);
    tileSize = screenSize.width / 9;
  }

}