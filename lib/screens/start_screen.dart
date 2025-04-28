import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/config/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class StartScreen extends ConsumerStatefulWidget {
  const StartScreen({
    super.key,
  });

  @override
  ConsumerState<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends ConsumerState<StartScreen> {
  bool hoveringStart = false;
  bool hovertingCode = false;
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
            left: 50,
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
                      hoveringStart = hover;
                    });
                  },
                  onPressed: () {
                    ref.read(gameScreenProvider.notifier).showPlayScreen();
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(fontFamily: 'Sorts Mill Goudy', fontSize: 40, color: hoveringStart ? Colors.black : Colors.white),
                  ),
                );
              },
            ),
          ),
          Positioned(
              bottom: 5,
              left: 10,
              child: TextButton(
                onHover: (hover) {
                  setState(() {
                    hovertingCode = hover;
                  });
                },
                onPressed: () => launchUrl(Uri.parse("https://github.com/Michkwetzel/ForestQuest")),
                child: Text(
                  'Code',
                  style: TextStyle(fontFamily: 'Sorts Mill Goudy', fontSize: 22, color:  hovertingCode ? Colors.blue : Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}
