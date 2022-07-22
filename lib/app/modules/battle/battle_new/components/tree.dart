import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FuckingTree extends StatelessWidget {
  const FuckingTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/png/itemicon_tree.png',
      height: 128,
    );
  }
}

class FuckingBranch extends StatelessWidget {
  FuckingBranch({Key? key}) : super(key: key);
  var scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubicEmphasized,
      scale: scale,
      onEnd: () {
        scale = 0.9;
      },
      child: SvgPicture.asset(
        'assets/svgs/branch.svg',
        height: 48,
        width: 48,
      ),
    );
  }
}
