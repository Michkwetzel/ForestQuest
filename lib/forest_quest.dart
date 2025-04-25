import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/enums.dart';
import 'package:forest_quest/final_screen.dart';
import 'package:forest_quest/main.dart';
import 'package:forest_quest/providers.dart';
import 'package:forest_quest/start_screen.dart';

class ForestQuest extends ConsumerWidget {
  const ForestQuest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GameStage stage = ref.watch(gameStateProvider).stage;
    return Center(
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 700,
            height: 700,
            child: stage == GameStage.start
                ? StartScreen()
                : Stack(
                    children: [
                      // Note the final Screen only shows after game is done. It it wrapped with opacity widget
                      FinalScreen(),
                      // Main Screen has reverse opasity setting as finalScreen. This is because I want the fading in and out of the screen.
                      MainGameScreen(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
