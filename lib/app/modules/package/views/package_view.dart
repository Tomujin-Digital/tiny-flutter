import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/app/modules/battle/utilities/colors.dart';

import '../controllers/package_controller.dart';

List<String> Options = ["Cloth", "Accessories"];

class PackageView extends GetView<PackageController> {
  const PackageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: height,
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Container(
              width: 320,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade200, width: 2),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Image.asset('assets/images/tiny/vector.png')),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset('assets/images/tiny/body.png'),
                    ),
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.network(
                            "https://s3.ap-southeast-1.amazonaws.com/tinyapp.elf/skin/${controller.cloth.value}.png"),
                      );
                    }),
                    Obx(() {
                      return Container(
                        padding: const EdgeInsets.all(18),
                        transform: Matrix4.translationValues(-4, -42.0, 0.0),
                        child: Image.network(
                            "https://s3.ap-southeast-1.amazonaws.com/tinyapp.elf/hat/${controller.hat.value}.png"),
                      );
                    })
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                  children: Options.map(
                (e) => GestureDetector(
                  onTap: () {
                    controller.setActive(e);
                  },
                  child: Obx(() {
                    return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        margin: const EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: controller.active.value == e
                                  ? kPink
                                  : Colors.grey.shade200,
                              width: 2),
                        ),
                        child: Text(e));
                  }),
                ),
              ).toList()),
            ),
            Expanded(child: Obx(() {
              if (controller.active.value == "Cloth") {
                return GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: controller.cloths
                        .map((e) => GestureDetector(
                              onTap: () {
                                controller.setCloth(e);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: controller.cloth.value == e
                                          ? kPink
                                          : Colors.grey.shade200,
                                      width: 1),
                                ),
                                child: Stack(children: [
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomRight:
                                                        const Radius.circular(
                                                            10),
                                                    bottomLeft:
                                                        Radius.circular(10)),
                                            color: const Color.fromRGBO(
                                                120, 81, 162, 1),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 6),
                                          child: const Text(
                                            "Health +2",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )),
                                  Image.network(
                                      "https://s3.ap-southeast-1.amazonaws.com/tinyapp.elf/skin/$e.png"),
                                ]),
                              ),
                            ))
                        .toList());
              } else if (controller.active.value == "Accessories") {
                return GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: controller.hats
                        .map((e) => GestureDetector(
                              onTap: () {
                                controller.setHat(e);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: controller.hat.value == e
                                          ? kPink
                                          : Colors.grey.shade200,
                                      width: 1),
                                ),
                                child: Stack(children: [
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: const BorderRadius
                                                    .only(
                                                bottomRight:
                                                    const Radius.circular(10),
                                                bottomLeft:
                                                    const Radius.circular(10)),
                                            color: const Color.fromRGBO(
                                                120, 81, 162, 1),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 6),
                                          child: const Text(
                                            "Health +2",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )),
                                  Container(
                                    transform: Matrix4.translationValues(
                                        0.0, 40.0, 0.0),
                                    child: Image.network(
                                        "https://s3.ap-southeast-1.amazonaws.com/tinyapp.elf/hat/$e.png"),
                                  )
                                ]),
                              ),
                            ))
                        .toList());
              } else {
                return Text(controller.active.value);
              }
            }))
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 300,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(10)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: const BorderSide(color: Colors.red)))),
          child: const Text(
            "Save",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
