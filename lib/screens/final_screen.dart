import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/config/providers.dart';

class FinalScreen extends ConsumerStatefulWidget {
  const FinalScreen({
    super.key,
  });

  @override
  ConsumerState<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends ConsumerState<FinalScreen> {
  int index = 0;
  bool isAnimating = false;
  List<String> sentenceList = [
    'Knowledge is\npower',
    'The more we\nknow',
    'The better we\ndo',
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Future.delayed(Duration(seconds: 2), () async {
      if (index < sentenceList.length - 1) {
        // Start to fade out
        setState(() {
          isAnimating = true;
        });

        await Future.delayed(Duration(milliseconds: 500));

        //Change text
        setState(() {
          index = index + 1;
        });

        await Future.delayed(Duration(milliseconds: 100));

        // Show new text
        setState(() {
          isAnimating = false;
        });

        startTimer();
      } else {
        await Future.delayed(Duration(seconds: 1));
        ref.read(gameStateProvider.notifier).restartGame();
        ref.read(gameScreenProvider.notifier).showStartScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 90,
          left: 0,
          child: AnimatedOpacity(
            opacity: isAnimating ? 0.0 : 1.0,
            duration: Duration(milliseconds: 500),
            child: Text(
              sentenceList[index],
              style: TextStyle(fontFamily: 'Sorts Mill Goudy', fontSize: 42, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
