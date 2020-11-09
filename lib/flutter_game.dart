import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class BoxGame extends Game {
  Size screenSize;

  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    Paint bgPaint2 = Paint();
    bgPaint.color = Color(0xf0000000);
    canvas.drawRect(bgRect, bgPaint);
    bgPaint2.color = Colors.amber;

    for (var i = 0; i < 400; i=i+50) {
      canvas.drawLine(Offset(i.toDouble(),0), Offset(i.toDouble(),1000), bgPaint2);
    }
    for (var j = 0; j < 1400; j=j+50) {
      canvas.drawLine(Offset(0,j.toDouble()), Offset(1000,j.toDouble()), bgPaint2);
    }

  }

  void update(double t) {
    // TODO: implement update
  }
}