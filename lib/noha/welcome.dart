
import 'package:flutter/material.dart';

import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:yarp1/employeeList.dart';
import 'package:yarp1/mode/employee.dart';
import 'package:yarp1/database/DbHelper.dart';

import 'package:yarp1/noha/HomePage.dart';
class Welcome extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {
    return new welcomestate();
  }

}

class welcomestate extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("welcome"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.indigo, Colors.lightBlueAccent,Colors.indigo],
            ),
          ),
        ),
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            Center(
              child: new Column(

                children: <Widget>[
                  new Image.asset("img/sara.jpg"),
                  new Padding(padding:  const EdgeInsets.all(50.0),
                      child: new RaisedButton(
                        color: Colors.indigo,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: new Text("  Login  ",style: TextStyle(color: Colors.white,fontSize: 20.0)),
                        onPressed: ()=> Navigator.of(context).pushNamed('/login'),
                      )

                  ),
                  new Padding(padding: const EdgeInsets.all(36.0),
                    child: new RaisedButton(
                    color: Colors.indigo,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: new Text("  Register  ",style: TextStyle(color: Colors.white,fontSize: 20.0)),
                    onPressed: ()=> Navigator.of(context).pushNamed('/Home'),
                  )
                  )
                ],
              ),
            )

          ],  ),
      ),

    );
  }

}