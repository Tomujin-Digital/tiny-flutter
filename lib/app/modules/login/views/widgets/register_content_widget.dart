import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
          SizedBox(height: 40),
          CachedNetworkImage(imageUrl: imageUrl),
          Expanded(child: child),
        ],
      ),
    );
  }
}
