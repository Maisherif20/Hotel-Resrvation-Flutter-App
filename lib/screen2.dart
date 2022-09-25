import 'package:flutter/material.dart';
import 'package:flutter_application_4/screen1.dart';
import 'package:intl/intl.dart';

class screen2 extends StatefulWidget {
  const screen2({Key? key}) : super(key: key);
  @override
  State<screen2> createState() => screen();
}

class screen extends State<screen2> {
  bool _swVal1 = false;
  bool _swVal2 = false;
  bool _swVal3 = false;
  var roomtype;
  void _singleroom(bool val) {
    setState(() {
      _swVal1 = val;
      roomtype = "Single Room";
    });
  }

  void _doubleroom(bool val) {
    setState(() {
      _swVal2 = val;
      roomtype = "Double Room";
    });
  }

  void _suiteroom(bool val) {
    setState(() {
      _swVal3 = val;
      roomtype = "Suite Room";
    });
  }

  void showAlertDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text(
        "Are you sure you want to proceed in checking out?",
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w900, color: Colors.blue),
      ),
      content: Text(
        """This is confirmation message that you agree on all data you entered:
      Check in date: ${DateFormat.yMMMd().format(check_in_date)} 
      Check out date: ${DateFormat.yMMMd().format(check_out_date)}
      Number of adults: ${rating.round()}
      Number of children: ${rat.round()}
      Extra:   ${Extra}
      View:    ${view} 
      Chosen Room: $roomtype """,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
            child: Text(
              "Confirm",
              style: TextStyle(fontSize: 20),
            )),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Discard",
              style: TextStyle(fontSize: 20),
            )),
      ],
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext) {
          return alertDialog;
        });
  }

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
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              ExpansionTile(
                leading: Image(
                  image: AssetImage("images/h.jpg"),
                  fit: BoxFit.cover,
                  width: 120,
                  height: 100,
                ),
                title: Row(
                  children: [
                    Text(
                      "Single Room",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Colors.blue),
                    ),
                    Switch(
                      value: _swVal1,
                      onChanged: _singleroom,
                      activeColor: Colors.blue,
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.rate_review,
                  color: Colors.blue,
                ),
                children: [
                  Padding(padding: EdgeInsets.all(7)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("images/rate1.jpg"),
                        width: 100,
                      ),
                      Text(
                        "A room assigned to one person",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(5)),
              ExpansionTile(
                leading: Image(
                  image: AssetImage("images/u.jpg"),
                  fit: BoxFit.cover,
                  width: 120,
                  height: 100,
                ),
                title: Row(
                  children: [
                    Text(
                      "Double Room",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Colors.blue),
                    ),
                    Switch(
                      value: _swVal2,
                      onChanged: _doubleroom,
                      activeColor: Colors.blue,
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.rate_review,
                  color: Colors.blue,
                ),
                children: [
                  Padding(padding: EdgeInsets.all(7)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("images/rate2.jpg"),
                        width: 100,
                      ),
                      Text(
                        """A room assigned to two people.
 May have one or more beds""",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(5)),
              ExpansionTile(
                leading: Image(
                  image: AssetImage("images/s.jpg"),
                  fit: BoxFit.cover,
                  width: 120,
                  height: 100,
                ),
                title: Row(
                  children: [
                    Text(
                      "Suite Room",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                          color: Colors.blue),
                    ),
                    Switch(
                      value: _swVal3,
                      onChanged: _suiteroom,
                      activeColor: Colors.blue,
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.rate_review,
                  color: Colors.blue,
                ),
                children: [
                  Padding(padding: EdgeInsets.all(7)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("images/rate1.jpg"),
                        width: 100,
                      ),
                      Text(
                        """A room with one or more bedrooms 
       and a separate living space.""",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                height: 50,
                width: 40,
                child: ElevatedButton(
                    onPressed: () {
                      showAlertDialog(context);
                    },
                    child: Text(
                      "Book Now",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
