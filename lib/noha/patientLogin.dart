import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yarp1/database/DbHelper.dart';
import 'dart:async';

class patlogin extends StatefulWidget {
  @override
  patloginList createState() => new patloginList();
}

class patloginList extends State<patlogin> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(
          ' Tracking',
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.indigo,
                Colors.lightBlueAccent,
                Colors.indigo
              ],
            ),
          ),
        ),
      ),
      body: new Container(
        padding: EdgeInsets.all(30.0),
        child: new ListView(
          children: <Widget>[

                new Text("Track My Things",style: TextStyle(color: Colors.indigo,fontSize: 30.0)),
            new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(20.0)),
                new Image.asset(
                  "img/track.jpg",
                  height: 224,
                  width: 299,
                ),
                new Padding(padding: EdgeInsets.all(40.0)),
                 new RaisedButton(
                  color: Colors.indigo , onPressed: ()=> Navigator.of(context).pushNamed('/Track'),
                   shape: RoundedRectangleBorder(
                       borderRadius:
                       BorderRadius.circular(20)),
                  
                  child: new Text('Track',style: TextStyle(color: Colors.white,fontSize: 20.0)),),
              ],
            )


          ],
        ),
      ),
    );
  }
  void track(){
    print("hello");
  }
}
