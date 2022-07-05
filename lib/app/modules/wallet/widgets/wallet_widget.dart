import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/buttons/touchable_scale.dart';
import '../../../config/app_constants.dart';
import '../../../config/custom_colors.dart';
import '../controllers/wallet_controller.dart';

class WalletCardWidget extends StatelessWidget {
  WalletCardWidget({Key? key}) : super(key: key);
  final controller = Get.find<WalletController>();
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250.0,
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
        enableInfiniteScroll: false,
        initialPage: 0,
        scrollDirection: Axis.horizontal,
      ),
      items: [1, 2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [primary, secondary],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your balance',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AppConstants.vElementSpacing,
                          Obx(() => Text(
                                controller.balance.value.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          AppConstants.vTitleSpacing,
                          Text(
                            'Locked Amount',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(255, 255, 255, 0.6),
                            ),
                          ),
                          AppConstants.vElementSpacing,
                          Text(
                            '220.00 elfc',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/tiny/elf_coin.png',
                        color: Colors.white,
                      )
                    ],
                  ),
                  AppConstants.vTitleSpacing,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TouchableScale(
                          child: Container(
                            width: Get.width * 0.36,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 0.4),
                              borderRadius: BorderRadius.circular(
                                12.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                  child: Text(
                                    'Deposit',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            // Get.toNamed('/');
                          }),
                      TouchableScale(
                          child: Container(
                            width: Get.width * 0.36,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(
                                12.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                  child: Text(
                                    'Withdraw',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
