import 'package:final_project/screens/questions2.dart';
import 'package:flutter/material.dart';

import '../components/reusable_card.dart';
import '../constants.dart';

class questions3 extends StatefulWidget {
  @override
  State<questions3> createState() => _questions3State();
}

class _questions3State extends State<questions3> {
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
                'What is Your Weekly Goal?',
                style: kLargeButtonTextStyle,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: COLOR,
              cardChild: Center(
                child: Text(
                  'Gain 0.2kg per week',
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
                  'Gain 0.5kg per week',
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
                  MaterialPageRoute(builder: (context) => questions2()),
                );
              },
            ),
          ),
          SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}
