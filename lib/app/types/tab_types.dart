import 'package:flutter/material.dart';

enum TabType { headline, news, profile }

extension TabItem on TabType {
  Icon get icon {
    switch (this) {
      case TabType.headline:
        return const Icon(Icons.home, size: 25);
      case TabType.news:
        return const Icon(Icons.newspaper, size: 25);
      case TabType.profile:
        return const Icon(Icons.person, size: 25);
    }
  }

  String get title {
    switch (this) {
      case TabType.headline:
        return "Headline";
      case TabType.news:
        return "News";
      case TabType.profile:
        return "Profile";
    }
  }
}
