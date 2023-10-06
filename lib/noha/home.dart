
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yarp1/employeeList.dart';
import 'package:yarp1/mode/employee.dart';
import 'package:yarp1/database/DbHelper.dart';

import 'package:yarp1/noha/HomePage.dart';
class Home extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }

}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Register"),
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
        //padding: EdgeInsets.fromLTRB(0, 40, 40, 40),
        child: new ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Text('Who are you?',
                  style: new TextStyle(
                    fontSize: 40.0,
                    color: Colors.indigo,
                  ),),
                //new Padding(padding: const EdgeInsets.all(30)),

                new Image.asset("img/noha.png",
                height: 149,
                width: 282,),
               // new Padding(padding: const EdgeInsets.all(30)),
                new  Padding(padding:  const EdgeInsets.all(12.0),

                    
                    child:  new RaisedButton(
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: new Text("  patient  ",style: TextStyle(color: Colors.white,fontSize: 20.0)),
                      onPressed: ()=> Navigator.of(context).pushNamed('/patient'),
                    )

                ),
                new  Padding(padding:  const EdgeInsets.all(12.0),

                    child:  new RaisedButton(
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: new Text("  Relative  ",style: TextStyle(color: Colors.white,fontSize: 20.0)),
                      onPressed:  ()=> Navigator.of(context).pushNamed('/Relative'),
                    )

                ),
                new  Padding(padding:  const EdgeInsets.all(2.0),

                    child:  new RaisedButton(
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: new Text("  Caregiver  ",style: TextStyle(color: Colors.white,fontSize: 20.0)),
                      onPressed:  ()=> Navigator.of(context).pushNamed('/HomePage'),
                    )

                ),
              ],
            )
          ],  ),
      ),
    );
  }

}