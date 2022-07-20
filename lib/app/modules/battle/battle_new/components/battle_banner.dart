import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import '../../core/components/animations/delay.dart';

class BattleBanner extends StatefulWidget {
  const BattleBanner({Key? key}) : super(key: key);

  @override
  State<BattleBanner> createState() => _BattleBannerState();
}

class _BattleBannerState extends State<BattleBanner> {
  @override
  Widget build(BuildContext context) {
    const double bannerHeight = 144.0;

    return SizedBox(
      height: bannerHeight,
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Delayed(
                  duration: const Duration(milliseconds: 500),
                  child: SizedBox(
                    height: 72.0,
                    child: DefaultTextStyle.merge(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: ClipRRect(
                                child: TweenAnimationBuilder<double>(
                                  tween: Tween<double>(begin: 0.0, end: 1.0),
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOutCubicEmphasized,
                                  builder: (context, anim, child) {
                                    return Align(
                                      alignment: Alignment.centerLeft,
                                      widthFactor: anim,
                                      child: child,
                                    );
                                  },
                                  child: Container(
                                    decoration: const ShapeDecoration(
                                      color: Color(0xffEF518B),
                                      shape: SmoothRectangleBorder(
                                        borderRadius:
                                            SmoothBorderRadius.horizontal(
                                          left: SmoothRadius(
                                            cornerRadius: 16.0,
                                            cornerSmoothing: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        16.0,
                                        0.0,
                                        0.0,
                                        0.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Daimaa",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const Text(
                                            "Level 2",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: ClipRRect(
                                child: TweenAnimationBuilder<double>(
                                  tween: Tween<double>(begin: 0.0, end: 1.0),
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOutCubicEmphasized,
                                  builder: (context, anim, child) {
                                    return Align(
                                      alignment: Alignment.centerRight,
                                      widthFactor: anim,
                                      child: child,
                                    );
                                  },
                                  child: Container(
                                    decoration: const ShapeDecoration(
                                      color: Color(0xffEF518B),
                                      shape: SmoothRectangleBorder(
                                        borderRadius:
                                            SmoothBorderRadius.horizontal(
                                          right: SmoothRadius(
                                            cornerRadius: 16.0,
                                            cornerSmoothing: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        0.0,
                                        0.0,
                                        16.0,
                                        0.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Skeleton Boss",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const Text(
                                            "Level 2",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: -1, end: 0.0),
                curve: Curves.easeInOutCubic,
                duration: const Duration(milliseconds: 450),
                builder: (context, anim, child) {
                  return FractionalTranslation(
                    translation: Offset(0.0, anim),
                    child: child,
                  );
                },
                child: Container(
                  width: 96.0,
                  decoration: ShapeDecoration(
                    color: const Color(0xff7851A2),
                    shape: BannerShapeBorder(),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: SizedBox(
                      height: 72.0,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          'assets/png/itemicon_equipment_weapon_battle.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BannerShapeBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    const bottomCutHeight = 32.0;
    final Path bannerPath = Path()
      ..moveTo(rect.left, rect.top)
      ..lineTo(rect.right, rect.top)
      ..lineTo(rect.right, rect.bottom - bottomCutHeight)
      ..lineTo(rect.center.dx, rect.bottom)
      ..lineTo(rect.left, rect.bottom - bottomCutHeight)
      ..close();

    return bannerPath;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  BannerShapeBorder scale(double t) {
    return BannerShapeBorder();
  }
}
