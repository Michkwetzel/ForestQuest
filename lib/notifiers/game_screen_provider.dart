import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/screens/final_screen.dart';
import 'package:forest_quest/screens/main_game_body.dart';
import 'package:forest_quest/screens/start_screen.dart';

class GameScreenNotifier extends StateNotifier<Widget> {
  GameScreenNotifier() : super(StartScreen());

  void showPlayScreen() {
    state = MainGameBody();
  }

  void showEndScreen() {
    state = FinalScreen();
  }

  void showStartScreen() {
    state = StartScreen();
  }
}
