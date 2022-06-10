import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/library/main_view.dart';
import 'package:pocket_tomyo/widgets/profile_card.dart';

import '../../../../widgets/land_card.dart';
import '../../../../widgets/land_category_card.dart';

import '../../../../widgets/small_land_card.dart';
import '../../../../widgets/sub_title_widget.dart';

import '../controllers/programs_controller.dart';

class ProgramsView extends MainView {
  ProgramsView({Key? key}) : super(key: key);
  final programsController = Get.put(ProgramsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileCard(height: 100),
            AppConstants.hTitleSpacing,
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 16.0),
              child: SizedBox(
                height: 48.0,
                width: double.infinity,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: AppConstants.borderRadius,
                    ),
                    labelText: 'Search',
                    prefix: SvgPicture.asset(
                      'assets/svgs/nav/search.svg',
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
            ),
            SubTitleWidget(
              leftPadding: 16.0,
              titleName: 'Suggest lands',
              textButtonName: 'See all',
              onTap: () {
                // TODO navigate to see all lands
              },
            ),
            SizedBox(
              height: 256.0,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => const LandCard()),
            ),
            const SubTitleWidget(
              leftPadding: 16.0,
              titleName: 'Lets find our lands',
              textButtonName: '',
            ),
            SizedBox(
              height: 50.0,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => const LandCategoryCard()),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return SmallLandCard(
                    imageUrl: 'https://picsum.photos/id/1/200/300',
                    index: index,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
