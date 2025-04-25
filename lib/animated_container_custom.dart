import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/providers.dart';

class AnimatedContainerCustom extends ConsumerWidget {
  const AnimatedContainerCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double smallBoxheight = 170;
    double bigBoxHeight = 400;

    final foundForestLength = ref.watch(gameStateProvider).foundForest.length;

    if (foundForestLength == 0) {
      // Keep default values
    } else if (foundForestLength == 1) {
      smallBoxheight = 0;
      bigBoxHeight = 400;
    } else if (foundForestLength == 2) {
      smallBoxheight = 0;
      bigBoxHeight = 200;
    } else if (foundForestLength == 3) {
      smallBoxheight = 0;
      bigBoxHeight = 100;
    } else if (foundForestLength == 4) {
      // Changed from 1 to 4
      smallBoxheight = 0;
      bigBoxHeight = 0;
      // Handle game finished outside of build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(gameStateProvider.notifier).setGameFinished();
      });
    }
    return Stack(children: [
      Positioned(
        right: 160,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(color: Colors.white),
          width: 130,
          height: bigBoxHeight,
        ),
      ),
      Positioned(
        top: 388,
        right: 195,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(color: Colors.white),
          width: 20,
          height: smallBoxheight,
        ),
      )
    ]);
  }
}
