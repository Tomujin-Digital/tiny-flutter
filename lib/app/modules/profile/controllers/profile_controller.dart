import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_tomyo/library/main_controller.dart';

class ProfileController extends MainController
    with GetSingleTickerProviderStateMixin {
  /// The [TabController] for the [TabBar] in the [ProfileView].
  late TabController tabController;

  /// Boolean to determine if [AppBar] is expanded or not.
  final isExpanded = false.obs;

  /// The current [ProfileTabType] that is selected first .
  final selectedIndex = 0.obs;

  /// changing the [Tab] and [TabView] when the [TabBar] is tapped.
  setIndex(int index) {
    tabController.animateTo(index, curve: Curves.linearToEaseOut);
  }

  @override
  void onInit() {
    super.onInit();

    /// init the [TabController]
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Future<void> getProfile() async {
    print('getProfile');
  }

  bool animateChild() {
    return isExpanded.value = !isExpanded.value;
  }
}
