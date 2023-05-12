
import 'package:flutter/material.dart';

import '../components/reusable_card.dart';
import '../constants.dart';
import 'input_page.dart';

class questions2 extends StatefulWidget {
  @override
  State<questions2> createState() => _questions2State();
}

class _questions2State extends State<questions2> {
  Color COLOR = kInactiveCardColour;
  Color COLOR1 = kInactiveCardColour;
  Color COLOR2 = kInactiveCardColour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color((0xFF111328)),
        title: Center(
          child: Text(
            'GOAL',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Center(
              child: Text(
                'What is Your Baseline activity level?',
                style: kLargeButtonTextStyle,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: COLOR,
              cardChild: Center(
                child: Text(
                  'Not very active',
                  style: kBodyTextStyle,
                ),
              ),
              onPress: () {
                setState(() {
                  COLOR = kActiveCardColour;
                  COLOR1 = kInactiveCardColour;
                  COLOR2 = kInactiveCardColour;
                });
              },
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: COLOR1,
              cardChild: Center(
                child: Text(
                  'Slightly active',
                  style: kBodyTextStyle,
                ),
              ),
              onPress: () {
                setState(() {
                  COLOR1 = kActiveCardColour;
                  COLOR = kInactiveCardColour;
                  COLOR2 = kInactiveCardColour;
                });
              },
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: COLOR2,
              cardChild: Center(
                child: Text(
                  'Active',
                  style: kBodyTextStyle,
                ),
              ),
              onPress: () {
                setState(() {
                  COLOR2 = kActiveCardColour;
                  COLOR1 = kInactiveCardColour;
                  COLOR = kInactiveCardColour;
                });
              },
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Colors.red.shade900,
              cardChild: Center(
                child: Text(
                  'NEXT',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
