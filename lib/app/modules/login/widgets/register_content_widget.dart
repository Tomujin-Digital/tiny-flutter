import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegisterContentWidget extends StatelessWidget {
  const RegisterContentWidget(
      {super.key, required this.imageUrl, required this.child});

  final String imageUrl;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.1),
          Image(
            image: AssetImage('assets/images/$imageUrl'),
            fit: BoxFit.contain,
            height: Get.height * 0.15,
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
