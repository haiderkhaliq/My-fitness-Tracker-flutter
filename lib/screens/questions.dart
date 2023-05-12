
import 'package:final_project/screens/question4.dart';
import 'package:final_project/screens/questions2.dart';
import 'package:final_project/screens/questions3.dart';
import 'package:flutter/material.dart';

import '../components/reusable_card.dart';
import '../constants.dart';
String caloriesss='';
class startupage extends StatefulWidget {
  @override
  State<startupage> createState() => _startupageState();
}

class _startupageState extends State<startupage> {
  Color COLOR = kInactiveCardColour;
  Color COLOR1 = kInactiveCardColour;
  Color COLOR2 = kInactiveCardColour;
  int decider = 3;

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
                'What is Your Goal?',
                style: kLargeButtonTextStyle,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: COLOR,
              cardChild: Center(
                child: Text(
                  'To Maintain weight',
                  style: kBodyTextStyle,
                ),
              ),
              onPress: () {
                setState(() {
                  COLOR = kActiveCardColour;
                  COLOR1 = kInactiveCardColour;
                  COLOR2 = kInactiveCardColour;
                  decider = 0;
                  caloriesss="The ideal calorie intake for your fitness goal would be 2000 Calories";
                });
              },
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: COLOR1,
              cardChild: Center(
                child: Text(
                  'To Lose weight',
                  style: kBodyTextStyle,
                ),
              ),
              onPress: () {
                setState(() {
                  COLOR1 = kActiveCardColour;
                  COLOR = kInactiveCardColour;
                  COLOR2 = kInactiveCardColour;
                  decider = 4;
                 caloriesss="The ideal calorie intake for your fitness goal would be 1500 Calories";
                });
              },
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: COLOR2,
              cardChild: Center(
                child: Text(
                  'To Gain weight',
                  style: kBodyTextStyle,
                ),
              ),
              onPress: () {
                setState(() {
                  COLOR2 = kActiveCardColour;
                  COLOR1 = kInactiveCardColour;
                  COLOR = kInactiveCardColour;
                  decider = 3;
                  caloriesss="The ideal calorie intake for your fitness goal would be 2500 Calories";
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
                if (decider == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => questions3(),
                    ),
                  );
                } else if (decider == 4) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => questions4(),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => questions2(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
