import 'package:flutter/material.dart';
import 'package:spine_flutter/spine_flutter.dart';

class SpineAnimationPayload {
  final String animation;
  final bool loop;

  SpineAnimationPayload(this.animation, {this.loop = false});

  static SpineAnimationPayload idle = SpineAnimationPayload('idle', loop: true);
}

class SpineController {
  final notifier = ValueNotifier<SpineAnimationPayload?>(null);
}

class Spine extends StatefulWidget {
  const Spine(this.assetName,
      {Key? key, this.controller, this.initialAnimation})
      : super(key: key);

  final String assetName;
  final SpineController? controller;
  final SpineAnimationPayload? initialAnimation;

  @override
  State<Spine> createState() => SpineState();
}

class SpineState extends State<Spine> {
  SkeletonAnimation? skeleton;

  String get name => widget.assetName;

  @override
  void initState() {
    loadSkeleton().then((value) {
      setState(() {});

      sync(widget.controller?.notifier.value);
      if (widget.initialAnimation != null) sync(widget.initialAnimation);

      widget.controller?.notifier.addListener(listener);
    });
    super.initState();
  }

  void listener() {
    sync(widget.controller?.notifier.value);
  }

  @override
  void dispose() {
    widget.controller?.notifier.removeListener(listener);
    super.dispose();
  }

  void sync(SpineAnimationPayload? payload) {
    if (payload == null) {
      skeleton?.state.setEmptyAnimation(0, 5.0);
    } else {
      skeleton?.state.setAnimation(0, payload.animation, payload.loop);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (skeleton == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SkeletonRenderObjectWidget(
      skeleton: skeleton!,
      alignment: Alignment.center,
      fit: BoxFit.contain,
      playState: PlayState.playing,
      debugRendering: false,
      triangleRendering: true,
    );
  }

  Future<SkeletonAnimation> loadSkeleton() async {
    return skeleton = await SkeletonAnimation.createWithFiles(name,
        pathBase: 'assets/spine/');
  }
}
