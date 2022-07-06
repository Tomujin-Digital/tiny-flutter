import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [NetWorkImageWidget] is a widget that displays a [NetworkImage] with a
/// custom [placeholder] and decorations.
/// It also has a [onTap] callback that is called when the image is tapped.
class NetWorkImageWidget extends StatelessWidget {
  /// TODO: add ErrorWidget
  const NetWorkImageWidget({
    Key? key,
    required this.height,
    required this.imageUrl,
    this.fit,
    this.margin,
    this.borderRadius,
    this.placeHolder,
    this.border,
    this.shadow,
    this.backgroundColor,
    this.onTap,
  }) : super(key: key);

  /// The height of the image.
  final double height;
  final EdgeInsets? margin;

  /// The URL of the image.
  final String imageUrl;

  /// How the image should be bordered.
  final BorderRadius? borderRadius;

  /// How the image should be inscribed into [BoxConstraints] intended
  final BoxFit? fit;

  /// The widget to display when the image is loading.
  final Widget? placeHolder;

  /// The border to display around the image.
  final BoxBorder? border;

  /// The shadow to display around the image.
  final List<BoxShadow>? shadow;

  /// backGround color of the image.
  final Color? backgroundColor;

  /// Called when the image is tapped.
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: height,
        width: height,
        decoration: BoxDecoration(
            border: border,
            borderRadius: borderRadius,
            boxShadow: shadow,
            color: backgroundColor),
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(0),
            child: CachedNetworkImage(
              placeholder: (context, url) =>
                  placeHolder ??
                  const Center(
                    child: CupertinoActivityIndicator(),
                  ),
              imageUrl: imageUrl,
              height: height,
              fit: fit ?? BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
