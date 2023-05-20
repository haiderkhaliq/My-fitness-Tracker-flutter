import 'package:final_project/components/reusable_card.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/screens/loginpage.dart';
import 'package:final_project/screens/waterdisplay.dart';
import 'package:flutter/material.dart';

import '../databasehelper.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final dbHelper = DatabaseHelper.instance;
  String name23 = '';
  String email23 = '';
  String pass23 = '';
  int water23 = 0;
  String disease23 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Profile Page"),
        ),
        backgroundColor: Color(
          (0xFF111328),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ReusableCard(
              colour: Color(0xFF111328),
              cardChild: Center(
                child: Text(
                  "Welcome to the profile page\n",
                  style: kBodyTextStyle,
                ),
              ),
              onPress: () async {
                name23 = await dbHelper.getNameById(columnID);
                email23 = await dbHelper.getEmailById(columnID);
                pass23 = await dbHelper.getpasslById(columnID);
                water23 = await dbHelper.getwaterlById(columnID);
                disease23 = await dbHelper.getdiseaselById(columnID);
              },
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: ()
              {
                setState(() {
                  if (name23 != null) {
                    print("Name: $name23");
                  } else {
                    print("No name found for the specified columnId.");
                  }
                });
              },
              colour: Color(0xFF111328),
              cardChild: Center(
                child: Text(
                  "Press for details",
                  style: kBodyTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Colors.black,
              cardChild: Center(
                child: Text("The name of the current user is : $name23"),
              ),
              onPress: () {
                // Specif
                setState(() {
                }); // y the desired columnId
              },
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Colors.black,
              cardChild: Center(
                child: Text("The email of the current user is : $email23"),
              ),
              onPress: () {
                // S
                setState(() {
                  if (email23 != null) {
                    print("Name: $email23");
                  } else {
                    print("No name found for the specified columnId.");
                  }
                }); // pecify the desired columnId
              },
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Colors.black,
              cardChild: Center(
                child: Text("The password of the current user is :$pass23"),
              ),
              onPress: () {
                // S
                setState(() {
                  if (pass23 != null) {
                    print("Name: $pass23");
                  } else {
                    print("No name found for the specified columnId.");
                  }
                }); // pecify the desired columnId
              },
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Colors.black,
              cardChild: Center(
                child: Text("The water level of the current user is: $water23"),
              ),
              onPress: () {
                // S
                setState(() {
                  if (water23 != null) {
                    print("Name: $water23".toString());
                  } else {
                    print("No name found for the specified columnId.");
                  }
                }); // pecify the desired columnId
              },
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Colors.black,
              cardChild: Center(
                child: Text("The disease of the current user is :$disease23"),
              ),
              onPress: () {
                // S
                setState(() {
                  if (disease23 != null) {
                    print("Name: $disease23".toString());
                  } else {
                    print("No name found for the specified columnId.");
                  }
                }); // pecify the desired columnId
              },
            ),
          ),
        ],
      ),
    );
  }
} // Specify the desired columnId
