import 'package:flutter/material.dart';
import 'package:flutter_application_4/screen1.dart';
import 'package:flutter_application_4/screen2.dart';
import 'package:intl/intl.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

DateTime check_in_date = DateTime.now();
DateTime check_out_date = DateTime.now();
var rating = 0.0;
var rat = 0.0;
var Extra;
var view;

class _MyAppState extends State<MyApp> {
  //Check-in-date

  void _datePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime(2023))
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        check_in_date = value;
        print(check_in_date.toString());
      });
    });
  }

  /////////////////////////////////////////////////

  void _datePickerout() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime(2023))
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        check_out_date = value;
        print(check_out_date.toString());
      });
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Costaway Resort",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 30,
                fontWeight: FontWeight.w300),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Column(
                    children: [
                      Image(
                        image: AssetImage("images/d.jpg"),
                        width: 410,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('Check-In Date.',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800)),
                          IconButton(
                            onPressed: _datePicker,
                            icon: Icon(Icons.date_range),
                            color: Colors.blue,
                          ),
                          Text(('${DateFormat.yMMMd().format(check_in_date)}'),
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Check-Out Date.',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800)),
                          IconButton(
                            onPressed: _datePickerout,
                            icon: Icon(Icons.date_range),
                            color: Colors.blue,
                          ),
                          Text(('${DateFormat.yMMMd().format(check_out_date)}'),
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Number of Adults:",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                          ),
                          Slider(
                            value: rating,
                            onChanged: (double val) {
                              setState(() => rating = val);
                            },
                            divisions: 10,
                            label: rating.toInt().toString(),
                            min: 0,
                            max: 10,
                          ),
                          Text("${(rating).round()}"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Number of Children",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                          ),
                          Slider(
                            value: rat,
                            onChanged: (double val) {
                              setState(() => rat = val);
                            },
                            divisions: 10,
                            label: rat.toInt().toString(),
                            min: 0,
                            max: 10,
                          ),
                          Text("${(rat).round()}"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Extras",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15)),
                          CheckboxGroup(
                              labelStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                              labels: <String>[
                                "Breakfast (50EGP/Day)",
                                "Internet Wifi (50EGP/Day)",
                                "Parking (100EGP/Day)",
                              ],
                              onSelected: (List<String> checked) {
                                setState(() {
                                  print("$checked");
                                  Extra = checked;
                                });
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          Text('View',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15)),
                          RadioButtonGroup(
                            labelStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            labels: <String>["Garden View ", "Sea View"],
                            onSelected: (String selected) {
                              setState(() {
                                view = selected;
                              });
                            },
                          ),
                          SizedBox(
                            width: 500,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => screen2()));
                              },
                              child: Text(
                                "Check Rooms and Rates",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
