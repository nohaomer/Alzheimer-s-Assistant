class Employee{

  String Name;
  String Age;
  String Phone;
  String minpay;
  String gender;

  Employee(this.Name, this.Age,this.Phone,this.minpay,this.gender);

  Employee.fromMap(Map map) {
    Name = map[Name];
    Age = map[Age];
    Phone = map[Phone];
    minpay = map[minpay];
    gender = map[gender];
  }

}