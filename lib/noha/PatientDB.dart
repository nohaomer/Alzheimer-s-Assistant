import 'package:flutter/material.dart';


import 'package:yarp1/noha/patientList.dart';
import 'package:yarp1/mode/Patient.dart';
import 'package:yarp1/database/DbHelper.dart';

class PatientDB extends StatefulWidget {
  final String title;
  PatientDB({Key key, this.title});

  @override
  State<StatefulWidget> createState() {
    return new PatientDBState();
  }
}

class PatientDBState extends State<PatientDB> {
  Patient patient = new Patient("", "", "", "", "");

  String userName, Name, Age, Password, Gender='Male';

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text("Register Patients"),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.view_list),
            tooltip: "View Patients",
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
              colors: <Color>[Colors.indigo, Colors.lightBlueAccent, Colors.indigo],
            ),
          ),
        ),
      ),
      body: new Padding(padding: EdgeInsets.all(16.0),
         child: new ListView(
          children: <Widget>[

            new Form(
              key: formKey,
                child: new Column(
                  children: <Widget>[
                    new TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(icon: Icon(Icons.account_circle,color: Colors.indigo),labelText: "User Name"),
                      validator: (val) =>
                      val.length == 0 ? "Enter User Name" : null,
                      onSaved: (val) => this.userName = val,
                    ),
                    new TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(icon: Icon(Icons.person,color: Colors.indigo),labelText: "Name"),
                      validator: (val) =>
                      val.length == 0 ? "Enter Name" : null,
                      onSaved: (val) => this.Name = val,
                    ),
                    new TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(icon: Icon(Icons.account_box,color: Colors.indigo),labelText: "Age"),
                      validator: (val) =>
                      val.length == 0 ? "Enter Age" : null,
                      onSaved: (val) => this.Age = val,
                    ),
                    new TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(icon: Icon(Icons.vpn_key,color: Colors.indigo),labelText: "Password"),
                      validator: (val) =>
                      val.length == 0 ? "Enter Password" : null,
                      onSaved: (val) => this.Password = val,
                      autofocus: false,
                      obscureText: true,
                    ),
                    new Padding(padding: EdgeInsets.all(15),),
                    new DropdownButton<String>(
                        value: this.Gender,
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
                          this.Gender = newValue;
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

  void navigateToEmployeeList() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new PatientList()),
    );
  }
  void submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    var pat = Patient(userName, Name, Age, Password,Gender);
    var dbHelper = DbHelper();
    dbHelper.savePatient(pat);
    showSnackBar("Account Created successfully");
  }


  void showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }
}
