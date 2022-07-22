import 'package:flutter/material.dart';

class TopThreeAvatarBox extends StatelessWidget {
  const TopThreeAvatarBox({
    Key? key,
    required this.place,
    // required this.userModel,
  }) : super(key: key);
  final int place;
  // final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    double customHeight;
    if (place == 1) {
      customHeight = 82;
    } else {
      customHeight = 68;
    }
    return SizedBox(
      height: customHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(315 / 360),
              child: Container(
                height: 17,
                width: 17,
                decoration: BoxDecoration(
                  color: const Color(0xff7851A2),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(45 / 360),
                  child: Align(
                    child: Text(
                      (place).toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
