import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class FindingMatch extends StatefulWidget {
  const FindingMatch({Key? key}) : super(key: key);

  @override
  State<FindingMatch> createState() => _FindingMatchState();
}

class _FindingMatchState extends State<FindingMatch>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;

  int _secondsPassed = 0;

  @override
  void initState() {
    _ticker = createTicker(_onTick)..start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _onTick(Duration duration) {
    int currentSecond = duration.inSeconds;

    if (currentSecond != _secondsPassed) {
      setState(() {
        _secondsPassed = currentSecond;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 16.0,
            cornerSmoothing: 1.0,
          ),
        ),
        color: Color(0xff7851A2),
      ),
      padding: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/png/itemicon_equipment_weapon_battle.png',
              height: 32.0,
            ),
          ),
          SizedBox(
            width: 132.0,
            child: Text(
              'Finding Match' + '.' * (_secondsPassed % 3 + 1),
              style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
