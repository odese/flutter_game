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
    addDotToDotList();
  }

  void addDotToDotList() {
    for (var i = widthMargin / 2; i <= (screenSize.width - widthMargin / 2); i = i + 50) {
      for (var j = heightMargin / 2; j <= (screenSize.height - heightMargin / 2); j = j + 50) {
        dotList.add(Dot(this, i.toDouble(), j.toDouble()));
      }
    }
  }

  void render(Canvas canvas) {
    boardRendering(canvas);
    // dotList.forEach((Dot dot) => dot.spawnDot(canvas));
    // for (var i = 0; i < dotList.length; i++) {
    //   if dotList[i].isClicked == true {
        // dot.render(canvas, dotList[i])
    // }
    //   dotList.forEach((Dot dot) => dot.render(canvas));
    // } 
    dotList.forEach((Dot dot) => dot.render(canvas));
  }

  void update(double t) {
    // dotList.forEach((Dot dot) => dot.updateDot(t));

    // dots.removeWhere((Dot dot) => dot.isOffScreen);
  }

  void resize(Size size) {
    screenSize = size;
    calculateBoardSize(screenSize);
  }

  void onTapDown(TapDownDetails d) {
    dotList.forEach((Dot dot) {
      var hitBox = Rect.fromCircle(center: Offset(dot.x, dot.y), radius: 25);
      if (hitBox.contains(d.globalPosition)) {
        dot.onTapDown(dot);
      }
    });
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

  calculateBoardSize(Size screenSize) {
    widthMargin = screenSize.width % 50;
    boardWidth = screenSize.width - widthMargin;

    heightMargin = screenSize.height % 50;
    boardHeight = screenSize.height - heightMargin;
  }
}
