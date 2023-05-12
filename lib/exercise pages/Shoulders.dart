
import 'package:flutter/material.dart';

import '../components/reusable_card.dart';
class shoulders extends StatefulWidget {


  @override
  State<shoulders> createState() => _shouldersState();
}

class _shouldersState extends State<shoulders> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color((0xFF111328)),
        title: Center(
          child: Text("Shoulder exercises"),
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
                          child: Image.asset('images/shoulder.jpeg'),
                        ),
                      )),
                  Expanded(
                    child: Container(
                      child: Image.asset('images/shoulder1.jpeg'),
                    ),
                  ),
                ],
              ),
            ),
            ReusableCard(
              cardChild: Center(
                child: Text(
                  "On avg a person burns about 200-250 Calories depending on the intensity of the shoulder workout"
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

