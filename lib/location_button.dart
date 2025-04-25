import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/enums.dart';
import 'package:forest_quest/providers.dart';

class LocationButton extends ConsumerStatefulWidget {
  final Location location;
  const LocationButton({super.key, required this.location});

  @override
  ConsumerState<LocationButton> createState() => _LocationButtonState();
}

class _LocationButtonState extends ConsumerState<LocationButton> {
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    final isDisabled = ref.watch(gameStateProvider).foundLocation.contains(widget.location);

    if (isDisabled) {
      return SizedBox(
        width: 200,
        height: 70,
      );
    }
    return SizedBox(
      width: 200,
      height: 70,
      child: InkWell(
        onHover: (hover) {
          setState(() {
            hovering = hover;
          });
        },
        onTap: () => ref.read(gameStateProvider.notifier).onLocationSelect(widget.location),
        onLongPress: () {},
        child: Text(
          widget.location.name,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Sorts Mill Goudy',
            fontSize: 20,
            color: ref.watch(gameStateProvider).selectedLocation == widget.location
                ? const Color.fromARGB(255, 106, 51, 31)
                : hovering
                    ? Colors.green
                    : Colors.black,
          ),
        ),
      ),
    );
  }
}
