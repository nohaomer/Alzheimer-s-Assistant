import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yarp1/mode/Relative.dart';
import 'package:yarp1/mode/employee.dart';
import 'package:yarp1/mode/Patient.dart';


class DbHelper{

  static Database myDb;

  Future<Database> get db async {
    if (myDb != null) return myDb;
    myDb = await initDb();
    return myDb;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "test.db");
    var theDb = await openDatabase(path, version: 6, onCreate: onCreate);
    return theDb;
  }

  void onCreate(Database db,int version) async{
    await db.execute(
        //"CREATE TABLE Employee(id INTEGER PRIMARY KEY, name TEXT, age TEXT, phone TEXT,minPay TEXT,gender TEXT )");
        "CREATE TABLE Employee2(id INTEGER PRIMARY KEY, name TEXT, age TEXT, phone TEXT,minPay TEXT,gender TEXT )");
    await db.execute(
        "CREATE TABLE Patient(id INTEGER PRIMARY KEY, username TEXT, name TEXT, age TEXT,password TEXT  ,gender TEXT )");
    await db.execute(
        "CREATE TABLE Relative(id INTEGER PRIMARY KEY, username TEXT, name TEXT, patientUsername TEXT,password TEXT  ,gender TEXT )");
    print("Created tables");
  }

  void saveEmployee(Employee employee) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO Employee2(name, age, phone, minPay,gender ) VALUES(' +
              '\'' +
              employee.Name +
              '\'' +
              ',' +
              '\'' +
              employee.Age +
              '\'' +
              ',' +
              '\'' +
              employee.Phone +
              '\'' +
              ',' +
              '\'' +
              employee.minpay+
              '\'' +
              ',' +
              '\'' +
              employee.gender +
              '\'' +
              ')');
    });
  }
  void savePatient(Patient pat) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(

          'INSERT INTO Patient(username, name, age, password,gender ) VALUES(' +
              '\'' +
              pat.userName +
              '\'' +
              ',' +
              '\'' +
              pat.Name +
              '\'' +
              ',' +
              '\'' +
              pat.Age +
              '\'' +
              ',' +
              '\'' +
              pat.Password +
              ' \''+
              ','+
              '\'' +
              pat.Gender +
              '\'' +
              ')');
    });
  }
  void saveRelative(Relative rel) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO Relative(username, name, patientUsername, password,gender ) VALUES(' +
              '\'' +
              rel.userName +
              '\'' +
              ',' +
              '\'' +
              rel.Name +
              '\'' +
              ',' +
              '\'' +
              rel.patientsUserName +
              '\'' +
              ',' +
              '\'' +
              rel.Password +
              ' \''+
              ','+
              '\'' +
              rel.Gender +
              '\'' +
              ')');
    });
  }

  Future<List<Employee>> getEmployees() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Employee2');
    List<Employee> employees = new List();
    for (int i = 0; i < list.length; i++) {
      employees.add(new Employee(list[i]["name"], list[i]["age"], list[i]["phone"], list[i]["minPay"], list[i]["gender"]));
    }
    print(employees.length);
    return employees;
  }


  Future<List<Patient>> getPatient() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Patient');
    List<Patient> pats = new List();
    for (int i = 0; i < list.length; i++) {
      pats.add(new Patient(list[i]["username"], list[i]["name"], list[i]["age"], list[i]["password"],list[i]["gender"]));
    }
    print(pats.length);
    return pats;
  }
  Future<List<Relative>> getRelative() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Relative');
    List<Relative> rels = new List();
    for (int i = 0; i < list.length; i++) {
      rels.add(new Relative(list[i]["username"], list[i]["name"], list[i]["patientUsername"], list[i]["password"],list[i]["gender"]));
    }
    print(rels.length);
    return rels;
  }
  Future<bool> check(String x) async{
    var dbClient = await db;
    // Patient v=new Patient("","","","","");
    // String x=v.userName;

    var result = await dbClient.rawQuery('SELECT * FROM Patient ');
    var v=result.toList();
    for(int i=0; i<v.length ;i++){
      if(v[i]['username']==x)
        return true;
    }
    return false;

  }
  Future<bool> log(String name ,String pass , String table) async{
    var dbClient = await db;
bool select=false;

    var result = await dbClient.rawQuery('SELECT * FROM $table ');
    var v = result.toList();
    print(v[0]["password"]+v[0]["username"]);
    for(int i = 0; i < v.length; i++){
      if(v[i]["username"]==name && v[i]["password"]==pass+" " )
        //if(v[i]["password"]==pass)
          select = true;
    }
    return select;


  }
}