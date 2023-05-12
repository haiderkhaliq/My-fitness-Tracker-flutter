import 'package:flutter/material.dart';

import '../components/reusable_card.dart';

class chest extends StatefulWidget {
  @override
  State<chest> createState() => _chestState();
}

class _chestState extends State<chest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color((0xFF111328)),
        title: Center(
          child: Text("Chest exercises"),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Center(
                  child: Container(
                    child: Image.asset('images/chest.jpeg'),
                  ),
                )),
                Expanded(
                  child: Container(
                    child: Image.asset('images/chest1.jpeg'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Center(
                child: Text(
                  "Alternate each exercise until three sets of each has been completed with no rest in-between to maximize calorie burning potential, up to 550 calories in one hour.",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
