import 'package:final_project/components/reusable_card.dart';
import 'package:final_project/screens/loginpage.dart';
import 'package:flutter/material.dart';

import '../databasehelper.dart';

class Doctorspage extends StatefulWidget {
  @override
  State<Doctorspage> createState() => _DoctorspageState();
}

class _DoctorspageState extends State<Doctorspage> {
  final dbHelper = DatabaseHelper.instance;
  String _selectedOption;
  String s = 'r';
  String restrictedFoods1='' ;

  List<String> _options = [
    'Diabetes',
    'Thallesimia',
    'Heart disease',
    'Nut Allergies'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xFF111328),
        title: Center(
          child: Text("Doctor's Page"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Expanded(
              child: Center(
                child: Text(
                  'Dieases',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(20),
            child: DropdownButton<String>(
              hint: Text("Select one"),
              dropdownColor: Colors.grey.shade900,
              isExpanded: true,
              value: _selectedOption,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.white, fontSize: 16),
              onChanged: (String newValue) {
                setState(() {
                  _selectedOption = newValue;
                  _updatedisease1(columnID, _selectedOption);
                });
              },
              items: _options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 100,),
          FloatingActionButton(
            backgroundColor: Colors.grey.shade900,
            child: Icon(Icons.check,color: Colors.white,),
            onPressed: () async {
              try {
                String foods = await DatabaseHelper.instance.getRestrictedFoods(_selectedOption);
                setState(() {
                  restrictedFoods1 = foods;
                });
              } catch (e) {
                print('Error getting restricted foods: $e');
              }
            },
          ),

          Expanded(
            child: ReusableCard(
              cardChild: Center(
                child: Text("THE RESTRICTED FOODS FOR THIS DISEASE ARE :"
                    " $restrictedFoods1"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updatedisease1(int rowId, String newdisease) async {
    await DatabaseHelper.instance.updatedisease(rowId, newdisease);
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }


}
