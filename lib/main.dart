import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/config/providers.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        title: 'Forest Quest',
        home: Scaffold(
          body: ForestQuest(),
        ),
      ),
    ),
  );
}

// Body
class ForestQuest extends ConsumerWidget {
  const ForestQuest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 700,
            height: 700,
            child: ref.watch(gameScreenProvider),
          ),
        ),
      ),
    );
  }
}
