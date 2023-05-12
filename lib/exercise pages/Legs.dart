import 'package:flutter/material.dart';

import '../components/reusable_card.dart';

class legs extends StatefulWidget {


  @override
  State<legs> createState() => _legsState();
}

class _legsState extends State<legs> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color((0xFF111328)),
        title: Center(
          child: Text("Legs exercises"),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Center(
                      child: Container(
                        child: Image.asset('images/leg.jpeg'),
                      ),
                    )),
                Expanded(
                  child: Container(
                    child: Image.asset('images/leg1.jpeg'),
                  ),
                ),
              ],
            ),
          ),
          ReusableCard(
            cardChild: Text(
              " On avg a person burns about 300-350 Calories depending on the intensity of the shoulder workout",
            ),
          ),
        ],
      ),
    );
  }
}

