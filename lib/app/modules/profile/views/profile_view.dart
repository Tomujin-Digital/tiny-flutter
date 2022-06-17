import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/app/types/profile_tab_types.dart';
import 'package:pocket_tomyo/library/main_view.dart';
import 'package:pocket_tomyo/widgets/profile_card.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends MainView {
  ProfileView({Key? key}) : super(key: key);
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => profileController.getProfile(),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0.0,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    // print('constraints=' + constraints.toString());
                    var height = constraints.biggest.height;
                    print(height);
                    return FlexibleSpaceBar(
                      expandedTitleScale: 1,
                      centerTitle: true,
                      title: Column(
                        children: [
                          ProfileCard(
                            height: height == 300 ? 100 : 80,
                          ),
                          height == 300
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                      ),
                                      child: Row(
                                        children: [
                                          height == 300
                                              ? Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '@Ochko',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.grey[800],
                                                        ),
                                                      ),
                                                      Text(
                                                        'Хүмүүн олон улсын сургуулийн 2-р ангийн сурагч Цаа хаусын гишүүн',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey[800],
                                                            fontSize: 14.0),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 3,
                                                      ),
                                                      AppConstants
                                                          .vTitleSpacing,
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Text('Following',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                              .grey[
                                                                          800],
                                                                      fontSize:
                                                                          14.0)),
                                                              const Text('13',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          18.0)),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: [
                                                              Text('Followers',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                              .grey[
                                                                          800],
                                                                      fontSize:
                                                                          14.0)),
                                                              const Text('1234',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          18.0))
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : const SizedBox(),
                                          Column(
                                            children: [
                                              AnimatedContainer(
                                                  duration: const Duration(
                                                    milliseconds: 500,
                                                  ),
                                                  width:
                                                      height == 300 ? 100 : 0,
                                                  height: 140.0,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.pink),
                                                  child: height == 300
                                                      ? const Center(
                                                          child: Icon(
                                                          Icons.add,
                                                        ))
                                                      : null)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                        ],
                      ),
                    );
                  },
                ),
                collapsedHeight: 100,
                expandedHeight: 300.0,
                stretchTriggerOffset: 200,
                pinned: true,
                floating: true,
                bottom: TabBar(
                  onTap: (index) {
                    profileController.selectedIndex.value = index;
                    profileController.setIndex(index);
                  },
                  controller: profileController.tabController,
                  tabs: ProfileTabType.values.map(
                    (e) {
                      return Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Tab(
                            icon: profileController.selectedIndex.value ==
                                    ProfileTabType.values.indexOf(e)
                                ? e.activeTabWidget
                                : e.tabWidget,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: true,
                child: TabBarView(
                    controller: profileController.tabController,
                    children: const [
                      Center(
                        child: Text('a'),
                      ),
                      Center(
                        child: Text('b'),
                      ),
                      Center(
                        child: Text('c'),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
