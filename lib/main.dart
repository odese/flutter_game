
import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/flutter_game.dart';

void main() {

  BoxGame game = BoxGame();
  runApp(game.widget);

  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);


}
