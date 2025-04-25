import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/animated_container_custom.dart';
import 'package:forest_quest/enums.dart';
import 'package:forest_quest/final_screen.dart';
import 'package:forest_quest/forest_quest.dart';
import 'package:forest_quest/game_buttons.dart';
import 'package:forest_quest/location_button.dart';
import 'package:forest_quest/providers.dart';
import 'package:forest_quest/start_screen.dart';

void main() {
  runApp(
    const ProviderScope(
        child: MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: ForestQuest(),
      ),
    )),
  );
}

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  double smallBoxheight = 30;
  double bigBoxHeight = 545;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Note the final Screen only shows after game is done. It it wrapped with opacity widget
        FinalScreen(),
        // Main Screen has reverse opasity setting as finalScreen. This is because I want the fading in and out of the screen.
        MainGameScreen(),
      ],
    );
  }
}

class MainGameScreen extends ConsumerWidget {
  const MainGameScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: ref.watch(gameStateProvider).gameFinished ? 0 : 1,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/img/single_tree.png'), fit: BoxFit.fitHeight),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 32, top: 32),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Forest Quest',
                    style: TextStyle(fontFamily: 'Sorts Mill Goudy', fontSize: 42, color: Colors.black),
                  ),
                  Tooltip(
                    preferBelow: true,
                    message:
                        "On the left you have a Forest. \nOn right you have a Location. \nMatch the Forest up with its correct location and see your tree grow. \nLong press a forest to see a hint",
                    child: Text(
                      "How to play",
                      style: TextStyle(fontFamily: 'Sorts Mill Goudy', fontSize: 20, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 40),
                  GameButtons(),
                ],
              ),
              AnimatedContainerCustom()
            ],
          ),
        ),
      ),
    );
  }
}
