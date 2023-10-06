import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yarp1/database/DbHelper.dart';
import 'dart:async';

import 'PatientDB.dart';

class Relogin extends StatefulWidget{

  @override
  ReloginList createState() => new ReloginList();

}

class ReloginList extends State<Relogin>{
  //PatientDB x=new PatientDB();

  String search="Age";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: new Text(
          ' View ',
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
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
        padding: EdgeInsets.all(30.0),
        child: new ListView(
          children: <Widget>[
            new Text("View Caregiver ",style: TextStyle(color: Colors.indigo,fontSize: 30.0)),
            new Padding(padding: EdgeInsets.all(20.0)),
            new Image.asset(
              "img/search.jpg",
              height: 224,
              width: 299,
            ),
           // new Padding(padding: EdgeInsets.all(40.0)),
            new Column(
              children: <Widget>[
                /*new DropdownButton<String>(
                  value: this.search,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      this.search = newValue;
                    });},
                  items: <String>['Age', 'Gender']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),*/
                new Padding(padding: EdgeInsets.all(40.0)),
                new RaisedButton(
                  color: Colors.indigo , shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(20)) ,//
                  onPressed:()=> Navigator.of(context).pushNamed('/Search'),

                  child: new Text('View',style: TextStyle(color: Colors.white,fontSize: 20.0)),),
              ],
            ),
          ],
        ),
      ),
    );

  }

  }


