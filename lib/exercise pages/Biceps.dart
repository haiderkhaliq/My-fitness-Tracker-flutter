import 'package:flutter/material.dart';

import '../components/reusable_card.dart';

class biceps extends StatefulWidget {


  @override
  State<biceps> createState() => _bicepsState();
}

class _bicepsState extends State<biceps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color((0xFF111328)),
        title: Center(
          child: Text("Biceps exercises"),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
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
                          child: Image.asset('images/bi.jpeg'),
                        ),
                      )),
                  Expanded(
                    child: Container(
                      child: Image.asset('images/bi1.jpeg'),
                    ),
                  ),
                ],
              ),
            ),
            ReusableCard(
              cardChild: Text(
                "On avg a person burns about 150-200 Calories depending on the intensity of the shoulder workout",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

