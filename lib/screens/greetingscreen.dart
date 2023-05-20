
import 'package:final_project/screens/questions.dart';
import 'package:flutter/material.dart';

import '../components/reusable_card.dart';
import '../constants.dart';
import '../databasehelper.dart';
import 'loginpage.dart';

class greetingpage extends StatefulWidget {
  @override
  State<greetingpage> createState() => _greetingpageState();
}

class _greetingpageState extends State<greetingpage> {
  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Text("WELCOME"),
        ),
        backgroundColor: Color((0xFF111328),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
             ReusableCard(
              cardChild: Center(
                child: Text(
                  "Welcome To My Fitness Tracker ",
                  style: kTitleTextStyle,
                ),
              ),
            ),

          SizedBox(
            height: 150,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,0,0,0),
                      child: Text(
                        "Lets Get Started",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150
                ),
                Expanded(
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.red.shade900,
                    onPressed: () {
                      setState(() {
                        _insert1();
                        insertDishes();
                        insertdisease();
                        _query2();
                        _query();
                        _query3();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => startupage(),
                          ),
                        );
                      });

                    },
                  ),
                ),
              ],
            ),
          ),
        ],
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
  Future<void> insertDishes() async {
    final List<Map<String, dynamic>> rows = [
      {
        DatabaseHelper.columnId: '1',
        DatabaseHelper.columnName: 'asparagus',
        DatabaseHelper.columncalories: 20,
      },
      {
        DatabaseHelper.columnId: '2',
        DatabaseHelper.columnName: 'bell pepper',
        DatabaseHelper.columncalories: 25,
      },
      {
        DatabaseHelper.columnId: '3',
        DatabaseHelper.columnName: 'broccoli',
        DatabaseHelper.columncalories: 45,
      },
      {
        DatabaseHelper.columnId: '4',
        DatabaseHelper.columnName: 'carrot',
        DatabaseHelper.columncalories: 30,
      },
      {
        DatabaseHelper.columnId: '5',
        DatabaseHelper.columnName: 'cauliflower',
        DatabaseHelper.columncalories: 25,
      },
      {
        DatabaseHelper.columnId: '6',
        DatabaseHelper.columnName: 'celery',
        DatabaseHelper.columncalories: 15,
      },
      {
        DatabaseHelper.columnId: '7',
        DatabaseHelper.columnName: 'cucumber',
        DatabaseHelper.columncalories: 10,
      },
      {
        DatabaseHelper.columnId: '8',
        DatabaseHelper.columnName: 'green beans',
        DatabaseHelper.columncalories: 20,
      },
      {
        DatabaseHelper.columnId: '9',
        DatabaseHelper.columnName: 'green cabbage',
        DatabaseHelper.columncalories: 25,
      },
      {
        DatabaseHelper.columnId: '10',
        DatabaseHelper.columnName: 'green onion',
        DatabaseHelper.columncalories: 10,
      },
      {
        DatabaseHelper.columnId: '11',
        DatabaseHelper.columnName: 'iceberg lettuce',
        DatabaseHelper.columncalories: 10,
      },
      {
        DatabaseHelper.columnId: '12',
        DatabaseHelper.columnName: 'mushrooms',
        DatabaseHelper.columncalories: 20,
      },
      {
        DatabaseHelper.columnId: '13',
        DatabaseHelper.columnName: 'onion',
        DatabaseHelper.columncalories: 45,
      },
      {
        DatabaseHelper.columnId: '14',
        DatabaseHelper.columnName: 'potato',
        DatabaseHelper.columncalories: 110,
      },
      {
        DatabaseHelper.columnId: '15',
        DatabaseHelper.columnName: 'radishes',
        DatabaseHelper.columncalories: 10,
      },
      {
        DatabaseHelper.columnId: '16',
        DatabaseHelper.columnName: 'sweet corn',
        DatabaseHelper.columncalories: 90,
      },
      {
        DatabaseHelper.columnId: '17',
        DatabaseHelper.columnName: 'sweet potato',
        DatabaseHelper.columncalories: 100,
      },
      {
        DatabaseHelper.columnId: '18',
        DatabaseHelper.columnName: 'tomato',
        DatabaseHelper.columncalories: 25,
      },
      {
        DatabaseHelper.columnId: '19',
        DatabaseHelper.columnName: 'beetroot',
        DatabaseHelper.columncalories: 43,
      },
      {
        DatabaseHelper.columnId: '20',
        DatabaseHelper.columnName: 'eggplant',
        DatabaseHelper.columncalories: 13,
      },
      {
        DatabaseHelper.columnId: '40',
        DatabaseHelper.columnName: 'Apple',
        DatabaseHelper.columncalories: 52,
      },
      {
        DatabaseHelper.columnId: '21',
        DatabaseHelper.columnName: 'Apricot',
        DatabaseHelper.columncalories: 48,
      },
      {
        DatabaseHelper.columnId: '22',
        DatabaseHelper.columnName: 'Avocado',
        DatabaseHelper.columncalories: 160,
      },
      {
        DatabaseHelper.columnId: '23',
        DatabaseHelper.columnName: 'Banana',
        DatabaseHelper.columncalories: 89,
      },
      {
        DatabaseHelper.columnId: '24',
        DatabaseHelper.columnName: 'Blackberries',
        DatabaseHelper.columncalories: 43,
      },
      {
        DatabaseHelper.columnId: '25',
        DatabaseHelper.columnName: 'Blood Oranges',
        DatabaseHelper.columncalories: 50,
      },
      {
        DatabaseHelper.columnId: '26',
        DatabaseHelper.columnName: 'Blueberries',
        DatabaseHelper.columncalories: 57,
      },
      {
        DatabaseHelper.columnId: '27',
        DatabaseHelper.columnName: 'Cherries',
        DatabaseHelper.columncalories: 50,
      },
      {
        DatabaseHelper.columnId: '28',
        DatabaseHelper.columnName: 'Cranberries',
        DatabaseHelper.columncalories: 46,
      },
      {
        DatabaseHelper.columnId: '29',
        DatabaseHelper.columnName: 'Dates',
        DatabaseHelper.columncalories: 282,
      },
      {
        DatabaseHelper.columnId: '30',
        DatabaseHelper.columnName: 'Fig',
        DatabaseHelper.columncalories: 74,
      },
      {
        DatabaseHelper.columnId: '31',
        DatabaseHelper.columnName: 'Fruit Salad',
        DatabaseHelper.columncalories: 230,
      },
      {
        DatabaseHelper.columnId: '32',
        DatabaseHelper.columnName: 'Grapes',
        DatabaseHelper.columncalories: 69,
      },
      {
        DatabaseHelper.columnId: '33',
        DatabaseHelper.columnName: 'Guava',
        DatabaseHelper.columncalories: 68,
      },
      {
        DatabaseHelper.columnId: '34',
        DatabaseHelper.columnName: 'Jackfruit',
        DatabaseHelper.columncalories: 95,
      },
      {
        DatabaseHelper.columnId: '35',
        DatabaseHelper.columnName: 'Kiwi',
        DatabaseHelper.columncalories: 61,
      },
      {
        DatabaseHelper.columnId: '36',
        DatabaseHelper.columnName: 'Lemon',
        DatabaseHelper.columncalories: 29,
      },
      {
        DatabaseHelper.columnId: '37',
        DatabaseHelper.columnName: 'Lime',
        DatabaseHelper.columncalories: 30,
      },
      {
        DatabaseHelper.columnId: '38',
        DatabaseHelper.columnName: 'Lychee',
        DatabaseHelper.columncalories: 66,
      },
      {
        DatabaseHelper.columnId: '39',
        DatabaseHelper.columnName: 'Mandarin Oranges',
        DatabaseHelper.columncalories: 53,
      },
      {
        DatabaseHelper.columnId: '41',
        DatabaseHelper.columnName: 'Burger',
        DatabaseHelper.columncalories: 295,
      },
      {
        DatabaseHelper.columnId: '42',
        DatabaseHelper.columnName: 'Pizza',
        DatabaseHelper.columncalories: 266,
      },
      {
        DatabaseHelper.columnId: '43',
        DatabaseHelper.columnName: 'Pasta',
        DatabaseHelper.columncalories: 131,
      },
      {
        DatabaseHelper.columnId: '44',
        DatabaseHelper.columnName: 'Tacos',
        DatabaseHelper.columncalories: 266,
      },
      {
        DatabaseHelper.columnId: '45',
        DatabaseHelper.columnName: 'Steak',
        DatabaseHelper.columncalories: 271,
      },
      {
        DatabaseHelper.columnId: '46',
        DatabaseHelper.columnName: 'Sandwich',
        DatabaseHelper.columncalories: 252,
      },
      {
        DatabaseHelper.columnId: '47',
        DatabaseHelper.columnName: 'Donor',
        DatabaseHelper.columncalories: 254,
      },
      {
        DatabaseHelper.columnId: '48',
        DatabaseHelper.columnName: 'Sausage',
        DatabaseHelper.columncalories: 301,
      },
      {
        DatabaseHelper.columnId: '49',
        DatabaseHelper.columnName: 'Biryani',
        DatabaseHelper.columncalories: 460,
      },
      {
        DatabaseHelper.columnId: '50',
        DatabaseHelper.columnName: 'Salad',
        DatabaseHelper.columncalories: 50,
      },
      {
        DatabaseHelper.columnId: '51',
        DatabaseHelper.columnName: 'Soya Beans',
        DatabaseHelper.columncalories: 446,
      },
      {
        DatabaseHelper.columnId: '52',
        DatabaseHelper.columnName: 'Fries',
        DatabaseHelper.columncalories: 312,
      },
      {
        DatabaseHelper.columnId: '53',
        DatabaseHelper.columnName: 'Oatmeal',
        DatabaseHelper.columncalories: 68,
      },
      {
        DatabaseHelper.columnId: '54',
        DatabaseHelper.columnName: 'Waffles',
        DatabaseHelper.columncalories: 291,
      },
      {
        DatabaseHelper.columnId: '55',
        DatabaseHelper.columnName: 'Smoothie',
        DatabaseHelper.columncalories: 37,
      },
      {
        DatabaseHelper.columnId: '56',
        DatabaseHelper.columnName: 'Boiled Egg',
        DatabaseHelper.columncalories: 155,
      },
      {
        DatabaseHelper.columnId: '57',
        DatabaseHelper.columnName: 'Kidney Beans',
        DatabaseHelper.columncalories: 333,
      },
      {
        DatabaseHelper.columnId: '58',
        DatabaseHelper.columnName: 'Red Lentils',
        DatabaseHelper.columncalories: 116,
      },
      {
        DatabaseHelper.columnId: '59',
        DatabaseHelper.columnName: 'Organic Quinoa',
        DatabaseHelper.columncalories: 222,
      },
      {
        DatabaseHelper.columnId: '61',
        DatabaseHelper.columnName: 'Fried Chicken',
        DatabaseHelper.columncalories: 246,
      },
      {
        DatabaseHelper.columnId: '62',
        DatabaseHelper.columnName: 'Egg Fried Rice',
        DatabaseHelper.columncalories: 280,
      },
      {
        DatabaseHelper.columnId: '63',
        DatabaseHelper.columnName: 'Fried Egg',
        DatabaseHelper.columncalories: 100,
      },
      {
        DatabaseHelper.columnId: '64',
        DatabaseHelper.columnName: 'Quesadillas',
        DatabaseHelper.columncalories: 293,
      },
      {
        DatabaseHelper.columnId: '65',
        DatabaseHelper.columnName: 'Omelet',
        DatabaseHelper.columncalories: 154,
      },
      {
        DatabaseHelper.columnId: '66',
        DatabaseHelper.columnName: 'Broth',
        DatabaseHelper.columncalories: 267,
      },
      {
        DatabaseHelper.columnId: '67',
        DatabaseHelper.columnName: 'Boiled Chicken',
        DatabaseHelper.columncalories: 148,
      },
      {
        DatabaseHelper.columnId: '68',
        DatabaseHelper.columnName: 'Boiled Mutton',
        DatabaseHelper.columncalories: 131,
      },
      {
        DatabaseHelper.columnId: '69',
        DatabaseHelper.columnName: 'Boiled Chickpeas',
        DatabaseHelper.columncalories: 364,
      },
      {
        DatabaseHelper.columnId: '70',
        DatabaseHelper.columnName: 'Pulao',
        DatabaseHelper.columncalories: 359,
      },
      {
        DatabaseHelper.columnId: '71',
        DatabaseHelper.columnName: 'Chicken Karahi',
        DatabaseHelper.columncalories: 93,
      },
      {
        DatabaseHelper.columnId: '72',
        DatabaseHelper.columnName: 'Kebab',
        DatabaseHelper.columncalories: 581,
      },
      {
        DatabaseHelper.columnId: '73',
        DatabaseHelper.columnName: 'Fish',
        DatabaseHelper.columncalories: 206,
      },
      {
        DatabaseHelper.columnId: '74',
        DatabaseHelper.columnName: 'Yogurt',
        DatabaseHelper.columncalories: 59,
      },
      {
        DatabaseHelper.columnId: '75',
        DatabaseHelper.columnName: 'Brownie',
        DatabaseHelper.columncalories: 466,
      },
      {
        DatabaseHelper.columnId: '76',
        DatabaseHelper.columnName: 'Lava Cake',
        DatabaseHelper.columncalories: 500,
      },
      {
        DatabaseHelper.columnId: '77',
        DatabaseHelper.columnName: 'Biscuits',
        DatabaseHelper.columncalories: 355,
      },
      {
        DatabaseHelper.columnId: '78',
        DatabaseHelper.columnName: 'Prawns',
        DatabaseHelper.columncalories: 115,
      },
      {
        DatabaseHelper.columnId: '79',
        DatabaseHelper.columnName: 'White Bread',
        DatabaseHelper.columncalories: 120,
      },

      // Add more rows as needed
    ];
    await DatabaseHelper.instance.insertAllIntoTable(rows);
  }
  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }



  void _query2() async {
    final allRows = await dbHelper.queryAllRows2();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }


  void _query3() async {
    final allRows = await dbHelper.queryAllRows3();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }
  Future<void> insertdisease() async {
    final List<Map<String, dynamic>> rows = [
      {
        DatabaseHelper.columndisease: 'Diabetes',
        DatabaseHelper.columnfoodrestrict:'White Rice'
      },
      {
        DatabaseHelper.columndisease: 'Diabetes',
        DatabaseHelper.columnfoodrestrict:'White Bread'
      },
      {
        DatabaseHelper.columndisease: 'Diabetes',
        DatabaseHelper.columnfoodrestrict:'Gulab Jamun'
      },
      {
        DatabaseHelper.columndisease: 'Diabetes',
        DatabaseHelper.columnfoodrestrict:'French Fries'
      },
      {
        DatabaseHelper.columndisease: 'Diabetes',
        DatabaseHelper.columnfoodrestrict:'Brownie'
      },
      {
        DatabaseHelper.columndisease: 'Thallesimia',
        DatabaseHelper.columnfoodrestrict:'Dates'
      },
      {
        DatabaseHelper.columndisease: 'Thallesimia',
        DatabaseHelper.columnfoodrestrict:'Broccoli'
      },
      {
        DatabaseHelper.columndisease: 'Thallesimia',
        DatabaseHelper.columnfoodrestrict:'Watermelon'
      },
      {
        DatabaseHelper.columndisease: 'Thallesimia',
        DatabaseHelper.columnfoodrestrict:'Prune Juice',
      },
      {
        DatabaseHelper.columndisease: 'Thallesimia',
        DatabaseHelper.columnfoodrestrict:'Beans'
      },
      {
        DatabaseHelper.columndisease: 'Heart disease',
        DatabaseHelper.columnfoodrestrict:'French Fries'
      },
      {
        DatabaseHelper.columndisease: 'Heart disease',
        DatabaseHelper.columnfoodrestrict:'Mutton'
      },
      {
        DatabaseHelper.columndisease: 'Heart disease',
        DatabaseHelper.columnfoodrestrict:'Cookies'
      },
      {
        DatabaseHelper.columndisease: 'Heart disease',
        DatabaseHelper.columnfoodrestrict:'Bacon'
      },
      {
        DatabaseHelper.columndisease: 'Heart disease',
        DatabaseHelper.columnfoodrestrict:'Fried Chicken',
      },
      {
        DatabaseHelper.columndisease: 'Nut Allergies',
        DatabaseHelper.columnfoodrestrict:'Peanut Butter'
      },
      {
        DatabaseHelper.columndisease: 'Nut Allergies',
        DatabaseHelper.columnfoodrestrict:'Peanuts'
      },
      {
        DatabaseHelper.columndisease: 'Nut Allergies',
        DatabaseHelper.columnfoodrestrict:'Icecream',
      },
      {
        DatabaseHelper.columndisease: 'Nut Allergies',
        DatabaseHelper.columnfoodrestrict:'Candy'
      },
      {
        DatabaseHelper.columndisease: 'Nut Allergies',
        DatabaseHelper.columnfoodrestrict:'Coffee'
      },



    ];
    await DatabaseHelper.instance.insertAllIntoTabledisease(rows);
  }
}

