class Relative{

  String userName;
  String Name;
  String patientsUserName;
  String Password;
  String Gender;

  Relative(this.userName, this.Name,this.patientsUserName,this.Password,this.Gender);

  Relative.fromMap(Map map) {
    userName = map[userName];
    Name = map[Name];
    patientsUserName = map[patientsUserName];
    Password = map[Password];
    Gender = map[Gender];
  }

}