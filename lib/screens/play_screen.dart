import 'package:flutter/material.dart';
import 'package:forest_quest/components/animated_container_custom.dart';
import 'package:forest_quest/components/game_buttons.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forest Quest',
              style: TextStyle(fontFamily: 'Sorts Mill Goudy', fontSize: 42, color: Colors.black),
            ),
            Tooltip(
              padding: EdgeInsets.all(8),
              preferBelow: true,
              message: """HOW TO PLAY:

Forests are on the left. 
Locations are on the right.

1. Match each Forest with its correct Location
2. Watch your tree grow!""",
              decoration: BoxDecoration(
                color: Color(0xff444F29),
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Sorts Mill Goudy',
                fontSize: 14,
              ),
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
    );
  }
}
