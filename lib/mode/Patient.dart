class Patient{

  String userName;
  String Name;
  String Age;
  String Password;
  String Gender;

  Patient(this.userName, this.Name,this.Age,this.Password,this.Gender);

  Patient.fromMap(Map map) {
    userName = map[userName];
    Name = map[Name];
    Age = map[Age];
    Password = map[Password];
    Gender = map[Gender];
  }

}