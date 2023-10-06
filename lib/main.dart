import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:yarp1/employeeList.dart';
import 'package:yarp1/mode/employee.dart';
import 'package:yarp1/database/DbHelper.dart';
import 'package:yarp1/noha/HomePage.dart';

import 'package:yarp1/noha/home.dart';
import 'package:yarp1/noha/login.dart';

import 'MainPage.dart';
import 'noha/PatientDB.dart';
import 'noha/ReLogin.dart';
import 'noha/RelativeDB.dart';
import 'noha/patientLogin.dart';
import 'noha/searchList.dart';
import 'noha/welcome.dart';

void main() => runApp(MaterialApp(
  home: Welcome(),
  title: "welcome",
  debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>{
      '/HomePage': (BuildContext context) => new HomePage(),
      '/Home': (BuildContext context) => new Home(),
      '/patient': (BuildContext context) => new PatientDB(),
      '/Relative': (BuildContext context) => new RelativeDB(),
      '/login': (BuildContext context) => new login(),
      '/Rellogin': (BuildContext context) => new Relogin(),
      '/patientlogin': (BuildContext context) => new patlogin(),
          '/Search': (BuildContext context) => new Search(),
      '/Track': (BuildContext context) => new MainPage(),


    }

));







