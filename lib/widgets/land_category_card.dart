import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app/config/app_constants.dart';

class LandCategoryCard extends StatelessWidget {
  const LandCategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: C.padding40,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: C.colorGrey2,
              width: 2.0,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          height: 42.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFF2F6FD)),
                  height: 32.0,
                  width: 32.0,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svgs/nav/tiny.svg',
                      height: 24.0,
                      width: 24.0,
                    ),
                  ),
                ),
                C.hElementSpacing,
                const Text(
                  'Land',
                  style: TextStyle(
                    color: C.colorDarkBlue,
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
