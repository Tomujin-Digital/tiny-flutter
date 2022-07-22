import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/app/modules/battle/battle_new/battle_screen.dart';
import 'package:pocket_tomyo/app/modules/tiny/widgets/custom_sliver_app_bar.dart';
import 'package:pocket_tomyo/widgets/buttons/touchable_scale.dart';

import '../../../config/app_constants.dart';
import '../../../config/custom_colors.dart';
import '../../battle/battle/battle_loading_page.dart';
import '../../battle/directory_page.dart';
import '../../journey/bindings/journey_binding.dart';
import '../../journey/views/journey_view.dart';

class BattleDetailView extends GetView {
  const BattleDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Battle Lesson',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              children: [
                TouchableScale(
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: Get.height * 0.2,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/tiny/avatar.png'),
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.pink,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 16,
                  left: 16.0,
                  child: const Text(
                    'English',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0),
                  ),
                ),
              ],
            ),
          )),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Select Skill card',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
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
                              'assets/images/tiny/skill.png',
                              fit: BoxFit.cover,
                            ),
                            C.hElementSpacing,
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 22),
                              child: Text(
                                'Super Health',
                                maxLines: 2,
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
                        Get.toNamed('/');
                      }),
                  TouchableScale(
                    onPressed: () {
                      Get.bottomSheet(Container(
                        height: Get.height * 0.5,
                        color: Colors.pink,
                      ));
                    },
                    child: Container(
                      width: Get.width * 0.4,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12.0),
                      decoration: BoxDecoration(
                        color: grey1,
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(24.0),
                            child: const Icon(
                              Icons.add,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Battle bet',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: PhysicalModel(
                color: Colors.white,
                elevation: 6.0,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  height: Get.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/tiny/elf_coin.png',
                        width: Get.height * 0.05,
                        height: Get.height * 0.05,
                      ),
                      const Text(
                        '100,000.0',
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: SizedBox(),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TouchableScale(
                    child: Container(
                      width: Get.width * 0.4,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12.0),
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
                          C.hElementSpacing,
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
                      print('journey');
                      Get.to(() => const JourneyView(),
                          binding: JourneyBinding());
                    }),
                TouchableScale(
                    child: Container(
                      width: Get.width * 0.4,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12.0),
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
                          C.hElementSpacing,
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
                      Get.to(() => VersusScreen());
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
