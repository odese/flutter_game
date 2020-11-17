import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/dotGa.dart';
import 'package:flame/util.dart';

void main() {
  DotGa game = DotGa();
  runApp(game.widget);

  initializeFlameUtil(game);
}

initializeFlameUtil(DotGa game) {
  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  // ignore: deprecated_member_use
  flameUtil.addGestureRecognizer(tapper);
}
