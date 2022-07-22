import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final bool? isRound;
  final BoxFit? fit;
  final double? aspectRatio;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.aspectRatio = 1.0,
    this.isRound = false,
    this.width,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: AspectRatio(
        aspectRatio: aspectRatio!,
        child: ClipRRect(
          borderRadius: isRound ?? false
              ? BorderRadius.circular(
                  height ?? width ?? MediaQuery.of(context).size.width / 2)
              : null,
          child: BlurHash(
            hash:
                '''f8C6M\$9tcY,FKOR*00%2RPNaaKjZUawdv#K4\$Ps:HXELTJ,@XmS2=yxuNGn%IoR*''',
            image: imageUrl,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            imageFit: fit!,
          ),
          // CachedNetworkImage(
          //   placeholderFadeInDuration: const Duration(milliseconds: 300),
          //   imageUrl: imageUrl,
          //   fit: BoxFit.cover,
          //   height: height,
          //   placeholder: (context, url) {
          //     return SizedBox(
          //       height: height,
          //       width: width,
          //       child: BlurHash(
          //         hash:
          //             '''f8C6M\$9tcY,FKOR*00%2RPNaaKjZUawdv#K4\$Ps:HXELTJ,@XmS2=yxuNGn%IoR*''',
          //         image: imageUrl,
          //         duration: const Duration(milliseconds: 300),
          //         curve: Curves.easeInOut,
          //         imageFit: fit!,
          //       ),
          //     );
          //   },
          //   errorWidget: (context, url, error) {
          //     return Center(
          //       child: Text('error'),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
