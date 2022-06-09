import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/library/main_view.dart';
import 'package:pocket_tomyo/widgets/avatar_card.dart';

import '../controllers/programs_controller.dart';

class ProgramsView extends MainView {
  ProgramsView({Key? key}) : super(key: key);
  final programsController = Get.put(ProgramsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AvatarCard(
              height: 100,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const Card(
                  child: ListTile(
                    title: Text(
                      'Programs',
                    ),
                  ),
                );
              },
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
