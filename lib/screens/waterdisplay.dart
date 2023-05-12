
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';
import 'package:final_project/databasehelper.dart';
import 'package:final_project/screens/loginpage.dart';
int waterlevel=1;
class water extends StatefulWidget {

  @override
  State<water> createState() => _waterState();
}

class _waterState extends State<water> {
  final dbHelper = DatabaseHelper.instance;
  int weight=waterlevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color((0xFF111328)),
        title: Text(
          "Water hydration",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Center(
                child: Text(
                  "Minimum 8 Glasses of water should be consumed daily",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                children: [
                  Container(
                      child:
                      Icon(Icons.water_drop)
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Glasses of water',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                      _update1(columnID,weight);
                                      _query();

                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                    _update1(columnID,weight);
                                    _query();
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

    void _update1(int rowId,int newWaterValue) async {
      await DatabaseHelper.instance.updateWater(rowId, newWaterValue);
    }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }
  }
