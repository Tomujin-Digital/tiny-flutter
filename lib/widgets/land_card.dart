import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/config/app_constants.dart';
import '../app/config/app_text_styles.dart';
import 'rec_image_widget.dart';

/// Widget for displaying Land information
class LandCard extends StatelessWidget {
  const LandCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO implement tap animation and go to detail page
        // Import land model
      },
      child: Container(
        margin: AppConstants.padding168,
        height: 240.0,
        width: Get.width * 0.8,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppConstants.colorGrey2,
            width: 1.0,
          ),
          image: const DecorationImage(
            image: CachedNetworkImageProvider(
              'https://www.videogameschronicle.com/files/2021/08/SuperMarioBrosArtwork2.jpg',
              maxHeight: 240,
              maxWidth: 200,
            ),
            fit: BoxFit.cover,
          ),
          color: Colors.pink,
          borderRadius: AppConstants.borderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 240 / 7 * 3,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: AppConstants.padding168,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Super Mario Bros',
                          style: AppTextStyles.greySubTitle,
                        ),
                        AppConstants.vElementSpacing,
                        Row(
                          children: [
                            RecImageWidget(
                              imageUrl:
                                  'https://www.videogameschronicle.com/files/2021/08/SuperMarioBrosArtwork2.jpg',
                              height: 60.0,
                              border: Border.all(
                                color: AppConstants.colorGrey1,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            AppConstants.hElementSpacing,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Human International school',
                                    style: AppTextStyles.greySubTitle),
                                AppConstants.vElementSpacing,
                                // implement Rating widget
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 14.0,
                                          color: Colors.yellow,
                                        ),
                                        AppConstants.hElementSpacing,
                                        Icon(
                                          size: 14.0,
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        AppConstants.hElementSpacing,
                                        Icon(
                                          size: 14.0,
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        AppConstants.hElementSpacing,
                                        Icon(
                                          size: 14.0,
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        AppConstants.hElementSpacing,
                                        Icon(
                                          size: 14.0,
                                          Icons.star,
                                          color: AppConstants.colorGrey1,
                                        ),
                                      ],
                                    ),
                                    AppConstants.hElementSpacing,
                                    Text(
                                      '4.5 | ',
                                      style: AppTextStyles.greySubTitle,
                                    ),
                                    const Text(
                                      '100 Learners',
                                      style: TextStyle(color: Colors.green),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
