import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yarp1/database/DbHelper.dart';
import 'package:yarp1/noha/ReLogin.dart';
import 'dart:async';

import 'package:yarp1/noha/patientLogin.dart';

class login extends StatefulWidget{

  @override
  loginList createState() => new loginList();

}

class loginList extends State<login>{
  String userName,  password, person='Patient';

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
        appBar: AppBar(
        title: new Text(
        'Login',
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
      body: new Padding(padding: EdgeInsets.all(16.6),
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              "img/login.png",
              height: 118,
              width: 100,
            ),
            new Padding(padding: EdgeInsets.all(25.0),),
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
                      decoration: new InputDecoration(icon: Icon(Icons.vpn_key,color: Colors.indigo),labelText: "Password"),
                      validator: (val) =>
                      val.length == 0 ? "Enter password" : null,
                      onSaved: (val) => this.password= val,
                      autofocus: false,
                      obscureText: true,
                    ),
                    new Padding(padding: EdgeInsets.all(15),),
                    new DropdownButton<String>(
                      value: this.person,
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
                          this.person = newValue;
                        });},
                      items: <String>['Patient', 'Relative']
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
                        child: new Text('Login',style: TextStyle(color: Colors.white,fontSize: 20.0)),),)
                  ],


                ),
            ),
          ],
        ),


      ),
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
    bool b = await dbHelper.log(this.userName, this.password, this.person);
   // print(this.userName + this.password + this.person);
    print(b);
    if (b && this.person == "Patient") {
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new patlogin ()),
      );
      showSnackBar("Create Account successfully");
    }

    else if(b && this.person  == "Relative"){
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new Relogin ()),
      );
    showSnackBar (" Account successfully");
  }else{
      showSnackBar ("This account not exist in database pleaes try again");
    }

  }


  void showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }
}