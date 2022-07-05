import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.0)),
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 220.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 4.4, 0.0),
          width: double.infinity,
          height: 56.0,
        ),
        background: Image.asset(
          "assets/images/tiny/battle_detail.png",
          fit: BoxFit.fill,
        ),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }
}
