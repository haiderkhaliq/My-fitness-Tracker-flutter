
import 'package:flutter/material.dart';

import '../components/reusable_card.dart';

class triceps extends StatefulWidget {


  @override
  State<triceps> createState() => _tricepsState();
}

class _tricepsState extends State<triceps> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color((0xFF111328)),
        title: Center(
          child: Text("triceps exercises"),
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
                          child: Image.asset('images/tri.jpeg'),
                        ),
                      )),
                  Expanded(
                    child: Container(
                      child: Image.asset('images/tri1.jpeg'),
                    ),
                  ),
                ],
              ),
            ),
            ReusableCard(
              cardChild: Center(
                child: Text(
                  "On avg a person burns about 100-150 Calories depending on the intensity of the shoulder workout",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}