import 'package:flutter/material.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/app/types/notifcation_types.dart';
import 'package:pocket_tomyo/widgets/rec_image_widget.dart';

class NotifcationWidget extends StatelessWidget {
  // final notifcationController = Get.put(NotifcationController());
  final NotifcationTypes type;
  final String title;
  final String message;
  final String time;
  final String imageUrl;

  const NotifcationWidget({
    super.key,
    required this.type,
    required this.title,
    required this.message,
    required this.time,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          RecImageWidget(
              margin: EdgeInsets.all(4.0),
              height: 60,
              imageUrl: imageUrl,
              backgroundColor: Colors.pink,
              borderRadius: BorderRadius.circular(9999)),
          AppConstants.hElementSpacing,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              AppConstants.vElementSpacing,
              Text(
                message,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          const Spacer(),
          type.notifcationWidget
        ],
      ),
    );
  }
}
