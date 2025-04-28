import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/config/enums.dart';
import 'package:forest_quest/config/providers.dart';

class ForestButton extends ConsumerStatefulWidget {
  final Forest forest;
  const ForestButton({super.key, required this.forest});

  @override
  ConsumerState<ForestButton> createState() => _ForestButtonState();
}

class _ForestButtonState extends ConsumerState<ForestButton> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final isDisabled = ref.watch(gameStateProvider).foundForest.contains(widget.forest);

    if (isDisabled) {
      return SizedBox(
        width: 200,
        height: 70,
      );
    }
    return SizedBox(
      width: 200,
      height: 70,
      child: Opacity(
        opacity: ref.watch(gameStateProvider).foundForest.contains(widget.forest) ? 0 : 1,
        child: InkWell(
          onHover: (hover) {
            setState(() {
              hovering = hover;
            });
          },
          onTap: () => ref.read(gameStateProvider.notifier).onForestSelect(widget.forest),
          onLongPress: () {},
          child: Text(
            widget.forest.name,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Sorts Mill Goudy',
              fontSize: 20,
              color: ref.watch(gameStateProvider).selectedForest == widget.forest
                  ? const Color(0xFFE7944A)
                  : hovering
                      ? Colors.green
                      : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
