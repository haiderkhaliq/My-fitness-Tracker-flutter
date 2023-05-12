import 'package:flutter/material.dart';

import '../components/reusable_card.dart';

class back extends StatefulWidget {


  @override
  State<back> createState() => _backState();
}

class _backState extends State<back> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color((0xFF111328)),
        title: Center(
          child: Text("Back exercises"),

        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
                  Expanded(
                      child: Center(
                        child: Container(
                          child: Image.asset('images/back.jpeg'),
                        ),
                      )),
                  Expanded(
                    child: Container(
                      child: Image.asset('images/back1.jpeg'),
                    ),
                  ),
            SizedBox(
             height: 150,
            ),
            ReusableCard(
              cardChild: Center(
                child: Text(
                  "In general, a 155-pound person will burn 112 calories in 30 minutes of weightlifting. At a vigorous pace, the burn increases to 223 calories in half an hour, according to Harvard Health Publishing.",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

