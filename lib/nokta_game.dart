import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter_app/components/dots.dart';

double boardWidth;
double boardHeight;
double widthMargin;
double heightMargin;

class NoktaGame extends Game {
  Size screenSize;
  Size boardSize;
  double tileSize;
  List<Dot> dots;

  NoktaGame() {
    initialize();
  }

  void initialize() async {
    dots = List<Dot>();
    resize(await Flame.util.initialDimensions());
    spawnDot();
  }

  void spawnDot() {
    for (var i = 50; i < screenSize.width; i = i + 50) {
      for (var j = 50; j < screenSize.height - 50; j = j + 50) {
        dots.add(Dot(this, i.toDouble(), j.toDouble()));
      }
    }
  }

  void render(Canvas canvas) {
    boardRendering(canvas);

    Paint linePaint = Paint();
    linePaint.color = Colors.blueAccent;
    for (var i = 0; i < 500; i = i + 50) {
      canvas.drawLine(
          Offset(i.toDouble(), 0), Offset(i.toDouble(), 1000), linePaint);
    }
    for (var j = 0; j < 1500; j = j + 50) {
      canvas.drawLine(
          Offset(0, j.toDouble()), Offset(1000, j.toDouble()), linePaint);
    }

    dots.forEach((Dot dot) => dot.render(canvas));
  }

  void update(double t) {
    dots.forEach((Dot dot) => dot.update(t));
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;

    calculateBoardSize(screenSize);
  }

  void onTapDown(TapDownDetails d) {
    dots.forEach((Dot dot) {
      if (dot.dotRect.contains(d.globalPosition) && !dots.contains(dot)) {
        dot.onTapDown();
      }
    });
  }
}

boardRendering(Canvas canvas) {
  Rect board =
      Rect.fromLTWH(widthMargin / 2, heightMargin / 2, boardWidth, boardHeight);
  Paint boardColor = Paint();
  boardColor.color = Colors.white;
  canvas.drawRect(board, boardColor);
}

calculateBoardSize(Size screenSize) {
  widthMargin = screenSize.width % 50;
  boardWidth = screenSize.width - widthMargin;

  heightMargin = screenSize.height % 50;
  boardHeight = screenSize.height - heightMargin;
}
