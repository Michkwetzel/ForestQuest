import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/enums.dart';
import 'package:forest_quest/providers.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({
    super.key,
  });

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/img/background.png'), fit: BoxFit.fitHeight),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 130,
            left: 80,
            child: Text(
              'Forest Quest',
              style: TextStyle(fontFamily: 'Sorts Mill Goudy', fontSize: 42, color: Colors.white),
            ),
          ),
          Positioned(
            top: 270,
            left: 310,
            child: Consumer(
              builder: (context, ref, child) {
                return TextButton(
                  onHover: (hover) {
                    setState(() {
                      hovering = true;
                    });
                  },
                  onPressed: () => ref.read(gameStateProvider.notifier).setGameStage(GameStage.play),
                  child: Text(
                    'Start',
                    style: TextStyle(fontFamily: 'Sorts Mill Goudy', fontSize: 40, color: hovering ? Colors.black : Colors.white),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
