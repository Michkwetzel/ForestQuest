import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/config/providers.dart';
import 'dart:html' as html;

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

class ForestQuest extends ConsumerStatefulWidget {
  const ForestQuest({super.key});

  @override
  ConsumerState<ForestQuest> createState() => _ForestQuestState();
}

class _ForestQuestState extends ConsumerState<ForestQuest> {
  bool _hasShownAlert = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasShownAlert && !isDesktop()) {
        _showMobileAlert();
      }
    });
  }

  void _showMobileAlert() {
    _hasShownAlert = true;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xff444F29),
        title: Text(
          'Not optimized for Mobile',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Sorts Mill Goudy',
            fontSize: 20,
          ),
        ),
        content: Text(
          'Please play on desktop.',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Sorts Mill Goudy',
            fontSize: 14,
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              'Continue Anyways',
              style: TextStyle(
                color: Color(0xFFF9D1AA),
                fontFamily: 'Sorts Mill Goudy',
                fontSize: 14,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  bool isDesktop() {
    final userAgent = html.window.navigator.userAgent.toLowerCase();
    // Check for mobile first
    if (userAgent.contains('mobile') || userAgent.contains('android')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
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
