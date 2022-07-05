import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../config/app_constants.dart';

typedef IntCallback = void Function(int val);

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final int currentPage;
  final int totalPages;

  final double height;
  final double topPadding;
  final IntCallback callback;

  const CustomAppBar(
      {super.key,
      required this.preferredSize,
      required this.currentPage,
      required this.totalPages,
      required this.callback,
      required this.height,
      required this.topPadding})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: height, left: 24, right: 24),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: const Color(0xFFF2F2F2),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          C.hTitleSpacing,
          for (int i = 0; i < totalPages; i++)
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: GestureDetector(
                        onTap: () {
                          print(i);
                          callback.call(i);
                        },
                        child: LinearProgressIndicator(
                          value: i < (currentPage - 1) ? 1 : 0,
                        ),
                      ),
                    ),
                  ),
                  C.hElementSpacing,
                ],
              ),
            ),
        ],
      ),
    );
  }
}
