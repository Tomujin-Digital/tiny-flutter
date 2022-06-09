import 'package:flutter/material.dart';

/// Ашиглагдаж буй жагсаалт [List] - үүд
enum ListType {
  programs,
  categories,
  notifications,
}

/// Бүх [View] - ууд удамшиж буй үндсэн [MainView].
/// Ингэснээр [empty] зэрэг  [function] - г удамшсан классууд ашиглах боломжтой.
class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }

  /// Ашиглагдаж буй жагсаалт [List] - үүд хоосон [isEmpty] байх үед харуулах [Widget].
  Widget empty(ListType type) {
    switch (type) {
      case ListType.programs:
        return const _EmptyWidget(
          description: '...',
          image: 'Программ оруулаагүй байна',
          title: '',
        );
      case ListType.categories:
        return const Center(
          child: Text('Ангилал байхгүй байна'),
        );
      case ListType.notifications:
        return const Center(
          child: Text('Мэдэгдэл байхгүй байна'),
        );
      default:
        return const Center(
          child: Text('Бусад алдаа'),
        );
    }
  }

  ///  [isLoading] нь хуудас ачааллаж байхад харуулна.
  Widget isLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

/// [_EmptyWidget] нь  тухайн [List] хоосон байх үед харуулж буй [Widget].
class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.image})
      : super(key: key);
  // final ListType type;
  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Image.asset(image),
        const SizedBox(height: 20),
        Text(title, style: Theme.of(context).textTheme.headline6),
        const SizedBox(height: 20),
        Text(description, style: Theme.of(context).textTheme.bodyText1),
        const SizedBox(height: 20),
      ],
    );
  }
}
