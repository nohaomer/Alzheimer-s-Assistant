
import 'package:flutter/material.dart';

import 'package:yarp1/mode/Patient.dart';

import 'package:yarp1/mode/Relative.dart';
import 'package:yarp1/database/DbHelper.dart';

import 'RelativeList.dart';

class RelativeDB extends StatefulWidget {
  final String title;
  RelativeDB({Key key, this.title});

  @override
  State<StatefulWidget> createState() {
    return new RelativeDBState();
  }
}

class RelativeDBState extends State<RelativeDB> {
  Relative relative = new Relative("", "", "", "", "");

  String userName, Name, PatientUserName, Password, Gender='Male';

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          title: new Text("Register Relative",style: new TextStyle(color:Colors.white),),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.view_list),
              tooltip: "View Relative",
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
                      decoration: new InputDecoration(icon: Icon(Icons.account_box,color: Colors.indigo),labelText: "Patient User Name"),
                      validator: (val) =>
                      val.length == 0 ? "Enter Patient User Name" : null,
                      onSaved: (val) => this.PatientUserName = val,
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
      new MaterialPageRoute(builder: (context) => new RelativeList()),
    );
  }
  void submit() async {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    var dbHelper = DbHelper();
    //Patient v=new Patient("'","" ,"", "", "");
    bool b = await dbHelper.check(this.PatientUserName);
    print(b);
    if ( b){
      var re = Relative(userName, Name, PatientUserName, Password,Gender);

      dbHelper.saveRelative(re);
      showSnackBar("Account Created successfully");
    }

    else
      showSnackBar("there is no patient has this name pleaes try again");

  }


  void showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }
}

