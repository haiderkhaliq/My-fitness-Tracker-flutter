import 'dart:developer';

import 'package:final_project/screens/caloriedisplay.dart';
import 'package:final_project/screens/signupage.dart';
import 'package:flutter/material.dart';

import '../components/reusable_card.dart';
import '../constants.dart';
import '../databasehelper.dart';
import 'greetingscreen.dart';
int columnID=0;
class login extends StatefulWidget {
  const login({Key key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  int w = 1;
  final dbHelper = DatabaseHelper.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color((0xFF111328)),
        title: const Center(
          child: Text(
            'LOGIN',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(35),
                    child: const Center(
                      child: Text(
                        'LOGIN TO YOUR ACCOUNT',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      ),
                    )),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  cursorColor: Colors.blue[900],
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',

                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: const Center(
                    child: Text(
                      'Login',
                      style: kLargeButtonTextStyle,
                    ),
                  ),
                  onPress: () async {
                    bool passexists = await dbHelper.checkpasswordExists(passwordController.text);
                    Map<String, dynamic> result = await DatabaseHelper.instance
                        .checkEntryExists(nameController.text);
                    if (result['exists']&&passexists) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => caloriedisplay(),
                        ),
                      );
                      columnID = result['id'];
                      print('Signed-in instance ID: $columnID');
                    } else {
                      print(
                          'Signed-in instance does not exist in the database.');
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Account does not exist.', style: TextStyle(fontSize: 15),),
                  Expanded(
                    child: TextButton(
                      child: const Text(
                        'Sign Up instead?',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyRegister(),
                          ),
                        );
                        //signup screen
                      },
                    ),
                  )
                ],
              ),
              const Expanded(
                child: SizedBox(
                  height: 200,
                ),
              )
            ],
          ),
        ),
      ),

    );
  }

  void _insert1() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnwater: 1,
      DatabaseHelper.columnId: columnID
    };
  }
    void _delete() async {
      // Assuming that the number of rows is the id for the last row.
      final id = await dbHelper.queryRowCount();
      final rowsDeleted = await dbHelper.delete(id);
      print('deleted $rowsDeleted row(s): row $id');
    }
    void _query() async {
      final allRows = await dbHelper.queryAllRows();
      print('query all rows:');
      allRows.forEach((row) => print(row));
    }
  }

