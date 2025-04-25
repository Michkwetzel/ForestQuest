import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/providers.dart';

class FinalScreen extends ConsumerWidget {
  const FinalScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: ref.watch(gameStateProvider).gameFinished ? 1 : 0,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/img/background.png'), fit: BoxFit.fitHeight),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 130,
              left: 25,
              child: Text(
                'Knowledge is \npower',
                style: TextStyle(fontFamily: 'Sorts Mill Goudy', fontSize: 42, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
