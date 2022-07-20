import 'package:flutter/material.dart';

class ElfWalletWidget extends StatelessWidget {
  const ElfWalletWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(255, 255, 255, 1),
          border: Border.all(
            color: const Color.fromRGBO(242, 242, 242, 1),
          ),
        ),
      ),
    );
  }
}
