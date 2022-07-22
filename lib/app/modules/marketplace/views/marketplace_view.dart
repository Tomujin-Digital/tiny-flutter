import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../widgets/custom_network_image.dart';
import '../controllers/marketplace_controller.dart';

class MarketplaceView extends GetView<MarketplaceController> {
  const MarketplaceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MarketplaceView'),
        centerTitle: true,
      ),
      body: const CustomNetworkImage(
          imageUrl: 'https://picsum.photos/id/5/300/300',
          isRound: true,
          height: 200),
    );
  }
}
