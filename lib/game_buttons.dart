import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/forest_button.dart';
import 'package:forest_quest/location_button.dart';
import 'package:forest_quest/providers.dart';

class GameButtons extends ConsumerWidget {
  const GameButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomForests = ref.read(gameStateProvider.notifier).randomForests;
    final randomLocations = ref.read(gameStateProvider.notifier).randomLocations;
    return Row(
      children: [
        // Forest buttons column
        SizedBox(
          width: 200, // Adjust width as needed
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: randomForests.length,
            itemBuilder: (context, index) {
              return ForestButton(forest: randomForests[index]);
            },
          ),
        ),
        // Location buttons column
        SizedBox(
          width: 200, // Adjust width as needed
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: randomLocations.length,
            itemBuilder: (context, index) {
              return LocationButton(location: randomLocations[index]);
            },
          ),
        ),
      ],
    );
  }
}
