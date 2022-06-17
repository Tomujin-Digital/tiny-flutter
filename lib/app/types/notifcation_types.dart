import 'package:flutter/material.dart';

enum NotifcationTypes {
  following,
  mentioned,
  rank,
  inviteWord,
  completeLevel,
}

extension on NotifcationTypes {
  Widget get notifcationWidget {
    switch (this) {
      case NotifcationTypes.following:
        return const Text('Following');
      case NotifcationTypes.mentioned:
        return const Text('Mentioned');
      case NotifcationTypes.rank:
        return const Text('Rank');
      case NotifcationTypes.inviteWord:
        return const Text('Invite Word');
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
