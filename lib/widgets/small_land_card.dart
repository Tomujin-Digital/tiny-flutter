import 'package:flutter/material.dart';
import '../app/config/app_constants.dart';
import 'rec_image_widget.dart';

class SmallLandCard extends StatelessWidget {
  const SmallLandCard({
    Key? key,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);

  /// index of the card
  final int index;

  /// image url of the card
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        // width: screenSize.width - 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: C.colorGrey2),
        ),
        child: Row(
          children: [
            /// Image
            NetWorkImageWidget(
              height: 80,
              imageUrl: imageUrl,
              borderRadius: BorderRadius.circular(12.0),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  const Text(
                    '   school.name',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'school.landName',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: C.colorGrey1),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      for (var i = 0; i < 5; i++)
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16.0,
                        ),
                      const SizedBox(width: 4.0),
                      const Text(
                        '${5}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: C.colorGrey1),
                      ),
                      const SizedBox(width: 4.0),
                      Container(
                        width: 2,
                        height: 14,
                        decoration: BoxDecoration(
                          color: C.colorGrey2,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      const Flexible(
                        child: Text(
                          'Students ${123}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: C.colorGrey1),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
