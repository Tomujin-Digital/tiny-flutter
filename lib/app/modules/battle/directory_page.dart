import 'package:flutter/material.dart';

class BattleDirectoryPage extends StatefulWidget {
  BattleDirectoryPage({Key? key}) : super(key: key);

  @override
  State<BattleDirectoryPage> createState() => _BattleDirectoryPageState();
}

class _BattleDirectoryPageState extends State<BattleDirectoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BATTLE")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Yu baina"),
        ],
      ),
    );
  }
}
