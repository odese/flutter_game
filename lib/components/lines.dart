import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/nokta_game.dart';

class Linex {
  final NoktaGame game;
  Linex line;
  Offset of1;
  Offset of2;
  Paint pai;

  Rect liner;

  Linex(this.game, Offset offset1, Offset offset2, Paint paint) {
    
    of1 = offset1;
    of2 = offset2;
    pai = paint;


  }

  void render(Canvas c) {
    c.drawLine(of1, of2, pai);
  }

  void update(double t) {}
}
