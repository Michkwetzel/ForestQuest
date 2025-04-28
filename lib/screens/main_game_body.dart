import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/screens/final_screen.dart';
import 'package:forest_quest/screens/play_screen.dart';
import 'package:forest_quest/config/providers.dart';

class MainGameBody extends ConsumerWidget {
  const MainGameBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool gameFinished = ref.watch(gameStateProvider).gameFinished;
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: gameFinished ? AssetImage('assets/img/background.png') : AssetImage('assets/img/single_tree.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 32, top: 32),
        child: gameFinished ? FinalScreen() : PlayScreen(),
      ),
    );
  }
}
