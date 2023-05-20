import 'package:final_project/screens/loginpage.dart';
import 'package:final_project/screens/profile.dart';
import 'package:final_project/screens/questions.dart';
import 'package:final_project/screens/waterdisplay.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pie_chart/pie_chart.dart';

import '../components/reusable_card.dart';
import '../databasehelper.dart';
import 'Doctorspage.dart';
import 'Exercises.dart';
import 'Timer.dart';
import 'input_page.dart';
String emaildisplay = '';
String namedisplay = '';
String passworddisplay = '';
int waterdisplay = 0;

class caloriedisplay extends StatefulWidget {
  @override
  State<caloriedisplay> createState() => _caloriedisplayState();
}

class _caloriedisplayState extends State<caloriedisplay> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  final dbHelper = DatabaseHelper.instance;

  String breakfast = 'hello';
  double va4 = 4;
  String lunch = '';
  String snacks = '';
  String Dinner = '';
  int calories11=0;

  Map<String, double> dataMap = {"empty": 0};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color((0xFF111328)),
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(
                    "My Fitness Tracker",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  "Profile Page",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => profile()),
                    );
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  "BMI CALC",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InputPage()),
                    );
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.sports_gymnastics),
                title: Text(
                  "Exercises",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => exercises()),
                    );
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.timer),
                title: Text(
                  "Timer",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TimerHomePage()),
                    );
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.water_drop),
                title: Text(
                  "Water Level",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onTap: () {
                  setState(()async {
                    waterlevel = await DatabaseHelper.instance.getWaterLevelById(columnID);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => water()),
                    );
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.medical_services),
                title: Text(
                  "Doctors Page",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Doctorspage()),
                    );
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Calorie Display"),
        backgroundColor: Color((0xFF111328)),
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Center(
                  child: PieChart(
                    chartRadius: 100.0,
                    dataMap: dataMap,
                    chartType: ChartType.ring,
                    baseChartColor: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: Colors.black,
                  cardChild: Center(
                    child: Text(
                      caloriesss,
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: SizedBox(
              height: 5,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 10,
              child: Center(
                child: Text("BREAKFAST"),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _controller,
                onSubmitted: (value) {
                  setState(()async {
                    calories11 = await dbHelper.getCaloriesByName(value);
                    breakfast=value;
                    caloriesss='';
                  });
                },
                cursorColor: Colors.blue[900],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Breakfast',
                ),
              ),
            ),
          ),
          Expanded(
            child: FloatingActionButton(
              backgroundColor: Colors.grey.shade900,
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  dataMap[breakfast] = calories11.toDouble();
                  dataMap.remove("empty");
                });
              },
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Submit"),
              )),

          //next lunch
          Expanded(
            child: SizedBox(
              height: 15,
              child: Center(
                child: Text("LUNCH"),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _controller1,
                onSubmitted: (value) {
                  setState(() async {
                    calories11 = await dbHelper.getCaloriesByName(value);
                    lunch = value;
                  });
                },
                cursorColor: Colors.blue[900],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Lunch',
                ),
              ),
            ),
          ),
          Expanded(
            child: FloatingActionButton(
              backgroundColor: Colors.grey.shade900,
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  dataMap[lunch] = calories11.toDouble();
                });
              },
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Submit"),
              )),
          //Dinner
          Expanded(
            child: SizedBox(
              height: 15,
              child: Center(
                child: Text("Dinner"),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _controller3,
                onSubmitted: (value) {
                  setState(() async{
                    calories11 = await dbHelper.getCaloriesByName(value);
                    Dinner = value;
                  });
                },
                cursorColor: Colors.blue[900],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Dinner',
                ),
              ),
            ),
          ),
          Expanded(
            child: FloatingActionButton(
              backgroundColor: Colors.grey.shade900,
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
              onPressed: () {
                setState(
                      () {
                    dataMap[Dinner] = calories11.toDouble();
                  },
                );
              },
            ),
          ),
          Expanded(child:
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Submit"),
          )
          ),
        ],
      ),
    );
  }
}
