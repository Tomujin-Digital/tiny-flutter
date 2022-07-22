import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      body: Center(
        child: Text(
          'MarketplaceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
