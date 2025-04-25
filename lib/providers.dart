import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/game_stage_notifier.dart';

final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameState>((ref) {
  return GameStateNotifier();
});
