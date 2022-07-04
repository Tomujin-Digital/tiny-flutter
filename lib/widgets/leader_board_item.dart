import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/widgets/rec_image_widget.dart';

class LeaderBoardItem extends StatelessWidget {
  const LeaderBoardItem({Key? key, required this.index}) : super(key: key);

  final int index;
  final double height = 116.0;
  final double horizontalMargin = 8.0;
  final double rankingHeight = 24.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              vertical: horizontalMargin, horizontal: 16.0),
          height: height - horizontalMargin * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppConstants.colorGrey2),
          ),
          child: Padding(
            padding: AppConstants.padding168,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NetWorkImageWidget(
                  height: height - horizontalMargin * 4,
                  imageUrl: 'https://picsum.photos/id/1/200/300',
                  borderRadius: BorderRadius.circular(9999.0),
                  backgroundColor: AppConstants.primaryColorPink,
                ),
                Column(
                  children: [
                    const Text(
                      'username',
                      style: TextStyle(fontSize: 15),
                    ),
                    const Text(
                      'username',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 8,
                  direction: Axis.vertical,
                  alignment: WrapAlignment.end,
                  children: [
                    Text(
                      'score'.toString(),
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff959595)),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.arrow_drop_up,
                          color: Colors.green,
                        ),
                        Text(
                          index.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        /// Positioning Ranking number
        Positioned.fill(
          left: 10,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Transform.rotate(
              /// [Rotate] it with 45˚ (π/4)
              angle: pi / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.pink,
                ),
                height: rankingHeight,
                width: rankingHeight,
                child: Transform.rotate(
                  /// [Rotate] it with -45˚ (π/4)
                  /// to make it look like a normal number[Not ratated]
                  angle: -pi / 4,
                  child: Center(
                    child: Text(
                      index.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
