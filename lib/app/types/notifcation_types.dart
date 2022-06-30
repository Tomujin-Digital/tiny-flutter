import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_tomyo/app/modules/0_initial/controllers/auth_controller.dart';
import 'package:pocket_tomyo/app/services/local_storage.dart';

enum NotifcationTypes {
  following,
  mentioned,
  rank,
  inviteWord,
  completeLevel,
}

extension NotifcationType on NotifcationTypes {
  Widget get notifcationWidget {
    switch (this) {
      case NotifcationTypes.following:
        return ElevatedButton(
            onPressed: () {
              print('somethin');
            },
            child: const Text('Follow'));

      case NotifcationTypes.mentioned:
        return const Text('Mentioned');
      case NotifcationTypes.rank:
        return ElevatedButton(
          onPressed: () async {
            // await Get.find<AuthController>().logOut();
          },
          child: Transform.rotate(
            /// [Rotate] it with 45˚ (π/4)
            angle: pi / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.purple,
              ),
              height: 20,
              width: 20,
              child: Transform.rotate(
                /// [Rotate] it with -45˚ (π/4)
                /// to make it look like a normal number[Not ratated]
                angle: -pi / 4,
                child: Center(
                  child: Text(
                    index.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

      case NotifcationTypes.inviteWord:
        return ElevatedButton(
            onPressed: () {
              print('somethin');
            },
            child: const Text('Join Word'));
      case NotifcationTypes.completeLevel:
        return const Text('Complete Level');
      default:
        return const Text('Unknown');
    }
  }

  String get value {
    switch (this) {
      case NotifcationTypes.following:
        return 'following';
      case NotifcationTypes.mentioned:
        return 'mentioned';
      case NotifcationTypes.rank:
        return 'rank';
      case NotifcationTypes.inviteWord:
        return 'inviteWord';
      case NotifcationTypes.completeLevel:
        return 'completeLevel';
      default:
        return '';
    }
  }
}
