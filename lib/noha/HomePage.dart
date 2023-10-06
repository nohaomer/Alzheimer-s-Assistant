import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:yarp1/employeeList.dart';
import 'package:yarp1/mode/employee.dart';
import 'package:yarp1/database/DbHelper.dart';


class HomePage extends StatefulWidget{

  final String title;
  HomePage({Key key, this.title});

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }

}

class HomePageState extends State<HomePage> {

  Employee employee = new Employee("", "", "", "","");

  String name, age, phone, minpayle,gender='Male';

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          title: new Text("Register Caregiver"),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.view_list),
              tooltip: "View Employees",
              onPressed: () {
                navigateToEmployeeList();
              },
            )
          ],
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
        body:
        new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new ListView(
            children: <Widget>[
              new Form(
                key: formKey,
                child: new Column(
                  children: <Widget>[
                    new TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(icon: Icon(Icons.person,color: Colors.indigo),labelText: " Name"),
                      validator: (val) =>
                      val.length == 0 ? "Enter  Name" : null,
                      onSaved: (val) => this.name = val,

                    ),
                    new TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(icon: Icon(Icons.account_box,color: Colors.indigo),labelText: 'Age'),
                      validator: (val) =>
                      val.length == 0 ? 'Enter Age' : null,
                      onSaved: (val) => this.age = val,
                    ),
                    new TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: new InputDecoration(icon: Icon(Icons.phone,color: Colors.indigo),labelText: 'Mobile No'),
                      validator: (val) =>
                      val.length == 0 ? 'Enter Mobile No' : null,
                      onSaved: (val) => this.phone = val,
                    ),
                    new TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(icon: Icon(Icons.attach_money,color: Colors.indigo),labelText: 'Min Pay per Day'),
                      validator: (val) =>
                      val.length == 0 ? 'Enter Min Pay per Day' : null,
                      onSaved: (val) => this.minpayle = val,
                    ),
                    new Padding(padding: EdgeInsets.all(15),),
                    new DropdownButton<String>(
                      value: this.gender,
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
                          this.gender = newValue;
                        });},
                      items: <String>['Male', 'Female']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    new Container(margin: const EdgeInsets.only(top: 50.0),
                      child: new RaisedButton(
                        color: Colors.indigo,onPressed: submit,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(20)),
                        child: new Text('Create',style: TextStyle(color: Colors.white,fontSize: 20.0)),),)

                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  void submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    var employee = Employee(name, age, phone, minpayle,gender);
    var dbHelper = DbHelper();

    dbHelper.saveEmployee(employee);
    showSnackBar("Account created successfully");
  }


  void showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  void navigateToEmployeeList() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new EmployeeList()),
    );
  }
}