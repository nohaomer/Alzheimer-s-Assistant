import 'package:flutter/material.dart';
import 'package:yarp1/mode/employee.dart';
import 'package:yarp1/database/DbHelper.dart';
import 'dart:async';



class EmployeeList extends StatefulWidget{

  @override
  EmployeePageList createState() => new EmployeePageList();

}

class EmployeePageList extends State<EmployeeList>{

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Caregiver List'),
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
        padding: new EdgeInsets.all(16.0),
        child: new FutureBuilder<List<Employee>>(
          future: fetchEmployeesFromDatabase(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new ListView.builder(

                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {

                    return new GestureDetector(

                        child: new Container(
                          width: 500.0,
                          padding: new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                          color: Color.fromRGBO(200,200,200,200),
                          child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text(
                                   snapshot.data[index].Name,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 18.0)),
                                new Text(snapshot.data[index].minpay,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 14.0)),
                                new Text(snapshot.data[index].gender,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 14.0)),

                                // new Divider()
                              ]
                          ),
                        )
                    );
                  });
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            return new Container(alignment: AlignmentDirectional.center,child: new CircularProgressIndicator(),);
          },
        ),
      ),
    );

  }

  void showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

}

Future<List<Employee>> fetchEmployeesFromDatabase() async {
  var dbHelper = DbHelper();
  Future<List<Employee>> employees = dbHelper.getEmployees();
  return employees;
}
