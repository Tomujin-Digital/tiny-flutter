import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/app/config/custom_colors.dart';
import 'package:pocket_tomyo/app/modules/tiny/views/battle_view.dart';
import 'package:pocket_tomyo/widgets/buttons/image_buttons.dart';
import 'package:pocket_tomyo/widgets/buttons/touchable_scale.dart';

import '../../../../widgets/profile_card.dart';
import '../controllers/tiny_controller.dart';

class TinyView extends GetView<TinyController> {
  const TinyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const ProfileCard(),
                AppConstants.vTitleSpacing,
                _TopMenu(),
                AppConstants.vTitleSpacing,
                SizedBox(height: Get.height * 0.1),
                Image.asset('assets/images/tiny/avatar.png'),
                AppConstants.vTitleSpacing,
                TouchableScale(
                    child: Container(
                      width: Get.width * 0.4,
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
                        children: [
                          Image.asset(
                            'assets/images/tiny/package.png',
                            fit: BoxFit.cover,
                          ),
                          AppConstants.hElementSpacing,
                          const Text(
                            'Package',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed('/');
                    }),
                AppConstants.vTitleSpacing,
                SizedBox(height: Get.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TouchableScale(
                        child: Container(
                          width: Get.width * 0.4,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12.0),
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/tiny/journey.png',
                                fit: BoxFit.cover,
                              ),
                              AppConstants.hElementSpacing,
                              const Text(
                                'Journey',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed('/');
                        }),
                    TouchableScale(
                        child: Container(
                          width: Get.width * 0.4,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12.0),
                          decoration: BoxDecoration(
                            color: secondary,
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/tiny/battle.png',
                                fit: BoxFit.cover,
                              ),
                              AppConstants.hElementSpacing,
                              const Text(
                                'Battle',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Get.to(() => BattleView());
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopMenu extends StatelessWidget {
  const _TopMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _WalletButton(),
        ImageButton(
          imagePath: 'assets/images/tiny/notif.png',
          onPressed: () {},
        ),
        ImageButton(
          imagePath: 'assets/images/tiny/message.png',
          onPressed: () {},
        ),
        ImageButton(
          imagePath: 'assets/images/tiny/gift.png',
          onPressed: () {},
        ),
        ImageButton(
          imagePath: 'assets/images/tiny/chat.png',
          onPressed: () {},
        )
      ],
    );
  }
}

class _WalletButton extends StatelessWidget {
  const _WalletButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableScale(
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primary,
              secondary,
            ],
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/svgs/tiny/wallet.svg',
            ),
            AppConstants.hElementSpacing,
            const Text(
              'Wallet',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  height: 1.2),
            ),
          ],
        ),
      ),
    );
  }
}
