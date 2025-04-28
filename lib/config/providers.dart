import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/notifiers/game_screen_provider.dart';
import 'package:forest_quest/notifiers/game_stage_notifier.dart';

final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameState>((ref) {
  return GameStateNotifier();
});

final gameScreenProvider = StateNotifierProvider<GameScreenNotifier, Widget>((ref) {
  return GameScreenNotifier();
});
