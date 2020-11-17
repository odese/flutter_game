import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter_app/components/dot.dart';

class DotGa extends Game {
  Size screenSize;
  Size boardSize;
  double boardWidth;
  double boardHeight;
  double widthMargin;
  double heightMargin;
  List<Dot> dotList = List<Dot>();

  DotGa() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    fillDotList();
  }

  void render(Canvas canvas) {
    boardRendering(canvas);
    dotRendering(canvas);
  }

  void update(double t) {}

  void onTapDown(TapDownDetails d) {
    for (var i = 0; i < dotList.length; i++) {
      if (dotList[i].isClicked == false) {
        Dot dot = dotList[i];
        Rect hitBox = dot.hitBox(dot);
        if (hitBox.contains(d.globalPosition)) {
          dot.onTapDown(dot);
        }
      }
    }
  }

  void resize(Size size) {
    screenSize = size;
    calculateBoardSize(screenSize);
  }

  calculateBoardSize(Size screenSize) {
    widthMargin = screenSize.width % 50;
    boardWidth = screenSize.width - widthMargin;

    heightMargin = screenSize.height % 50;
    boardHeight = screenSize.height - heightMargin;
  }

  void fillDotList() {
    var dotPaint = Paint();
    dotPaint.color = Colors.transparent;
    for (var i = widthMargin / 2; i <= (screenSize.width - widthMargin / 2); i = i + 50) {
      for (var j = heightMargin / 2; j <= (screenSize.height - heightMargin / 2); j = j + 50) {
        dotList.add(Dot(i.toDouble(), j.toDouble(), dotPaint, false));
      }
    }
  }

  boardRendering(Canvas canvas) {
    Rect board = Rect.fromLTWH(widthMargin / 2, heightMargin / 2, boardWidth, boardHeight);
    Paint boardColor = Paint();
    boardColor.color = Colors.white;
    canvas.drawRect(board, boardColor);

    Paint gridColor = Paint();
    gridColor.color = Colors.blueAccent;
    for (var i = widthMargin / 2; i <= screenSize.width - widthMargin / 2; i = i + 50) {
      canvas.drawLine(Offset(i.toDouble(), heightMargin / 2), Offset(i.toDouble(), boardHeight + heightMargin / 2), gridColor);
    }
    for (var j = heightMargin / 2; j <= screenSize.height - heightMargin; j = j + 50) {
      canvas.drawLine(Offset(widthMargin / 2, j.toDouble()), Offset(boardWidth + widthMargin / 2, j.toDouble()), gridColor);
    }
  }

  dotRendering(Canvas canvas) {
    for (var i = 0; i < dotList.length; i++) {
      if (dotList[i].isClicked == true) {
        Dot dot = dotList[i];
        dot.renderDot(canvas, dotList[i]);
      }
    }
  }
}
