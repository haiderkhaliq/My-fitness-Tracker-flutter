
import 'package:flutter/material.dart';

import '../components/reusable_card.dart';
import '../constants.dart';
import '../exercise pages/Biceps.dart';
import '../exercise pages/Legs.dart';
import '../exercise pages/Shoulders.dart';
import '../exercise pages/back.dart';
import '../exercise pages/chest.dart';
import '../exercise pages/triceps.dart';




class exercises extends StatefulWidget {
  @override
  State<exercises> createState() => _exercisesState();
}

class _exercisesState extends State<exercises> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color((0xFF111328)),
        title: Center(
          child: Text("Exercises"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColour,
                    cardChild: Center(
                      child: Text(
                        "CHEST",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => chest(),
                        ),
                      );
                    },
                  ),
                ),
                //BACK
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColour,
                    cardChild: Center(
                      child: Text(
                        "BACK",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => back(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          //SHOULDERS
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColour,
                    cardChild: Center(
                      child: Text(
                        "SHOULDERS",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => shoulders(),
                        ),
                      );
                    },
                  ),
                ),
                //TRICEPS
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColour,
                    cardChild: Center(
                      child: Text(
                        "TRICEPS",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => triceps(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          //BICEPS
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColour,
                    cardChild: Center(
                      child: Text(
                        "BICEPS",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => biceps(),
                        ),
                      );
                    },
                  ),
                ),
                //LEGS
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColour,
                    cardChild: Center(
                      child: Text(
                        "LEGS",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => legs(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
