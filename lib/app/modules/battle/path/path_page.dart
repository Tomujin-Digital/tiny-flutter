import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:spine_flutter/spine_flutter.dart';

import '../core/components/touchables/flat_button.dart';

class SpinePreviewScreen extends StatefulWidget {
  const SpinePreviewScreen({Key? key}) : super(key: key);

  @override
  State<SpinePreviewScreen> createState() => _SpinePreviewScreenState();
}

class _SpinePreviewScreenState extends State<SpinePreviewScreen> {
  final List<String> spines = [
    'player',
    'boss',
  ];

  String currentSpine = 'player';
  Set<String> animations = {};
  SkeletonAnimation? skeleton;

  @override
  void initState() {
    load().then((value) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> states = <Widget>[];
    for (final String animation in animations) {
      states.add(
        FilledButton(
          child: Text(animation.toLowerCase()),
          onPressed: () {
            skeleton?.state.setAnimation(0, animation, true);
            // skeleton?.state.setEmptyAnimation(0, 0.0);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Preview')),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                runAlignment: WrapAlignment.start,
                spacing: 8.0,
                runSpacing: 8.0,
                children: <Widget>[
                  for (final String spine in spines)
                    FilledButton(
                      child: Text(spine.toLowerCase()),
                      onPressed: () {
                        setState(() {
                          currentSpine = spine;
                          load().then((value) => setState(() {}));
                        });
                      },
                    ),
                ],
              ),
            ),
          ),
          skeleton == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: SizedBox(
                    height: 228.0,
                    child: SkeletonRenderObjectWidget(
                      skeleton: skeleton!,
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      playState: PlayState.playing,
                      debugRendering: false,
                      triangleRendering: true,
                    ),
                  ),
                ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                runAlignment: WrapAlignment.end,
                spacing: 8.0,
                runSpacing: 8.0,
                children: states,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> load() async {
    animations = await loadAnimations();
    skeleton = await loadSkeleton();
  }

  Future<Set<String>> loadAnimations() async {
    final String skeletonFile = '$currentSpine.json';
    final String s =
        await rootBundle.loadString('assets/spine/$currentSpine/$skeletonFile');
    final Map<String, dynamic> data = json.decode(s);

    return ((data['animations'] ?? <String, dynamic>{}) as Map<String, dynamic>)
        .keys
        .toSet();
  }

  Future<SkeletonAnimation> loadSkeleton() async =>
      SkeletonAnimation.createWithFiles(currentSpine,
          pathBase: 'assets/spine/');
}
