import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/app/modules/0_initial/controllers/auth_controller.dart';
import 'package:pocket_tomyo/widgets/rec_image_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _PostTop(),
        AppConstants.vElementSpacing,
        _PostContent(),
        _PostActions(),
      ],
    );
  }
}

class _PostTop extends StatelessWidget {
  const _PostTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              NetWorkImageWidget(
                onTap: () {
                  // TODO navigate to community detail
                },
                height: 48,
                imageUrl: 'https://picsum.photos/200/300',
                borderRadius: BorderRadius.circular(9999.0),
                placeHolder: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9999.0),
                      color: AppConstants.colorGrey1),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: NetWorkImageWidget(
                    onTap: () {
                      // TODO navigate to profile detail
                    },
                    height: 44,
                    imageUrl: 'https://picsum.photos/300/300',
                    borderRadius: BorderRadius.circular(9999.0),
                    placeHolder: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9999.0),
                          color: AppConstants.colorGrey1),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AppConstants.hTitleSpacing,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('John Doe'),
              Text('2 hours ago'),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}

class _PostContent extends StatelessWidget {
  const _PostContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        viewportFraction: 1,
        enableInfiniteScroll: false,
        onPageChanged: (index, _) {},
      ),
      items: items.map((item) {
        return Container(
          margin: const EdgeInsets.all(5),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.network(
              'https://picsum.photos/id/${Random().nextInt(20)}/900/500',
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _PostActions extends StatelessWidget {
  const _PostActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text('Reaction by Bilegt'),
              const Spacer(),
              IconButton(
                onPressed: () {
                  // log out
                  Get.find<AuthController>().logOut();
                },
                icon: const Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.comment_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.save_alt),
              ),
            ],
          ),
          const Text(
              'Амжилт, зорилго, мөрөөдөлд нь хүргэх хамгийн баталгаатай арга бол бага багаар урагшаа алхалах юм шүү. '),
          AppConstants.vElementSpacing,
        ],
      ),
    );
  }
}
