// WareHouse Mangement System
import 'dart:io';

List Employees = [];
Map Employee = {};
void main() {
  MainMenu();
}

MainMenu() {
  print("1) Employee Management"); //Admin
  print("2) Product Management");
  print("3) Quit");
  int choice = int.parse(stdin.readLineSync()!);
  if (choice == 1) {
    EmployeeManagement(); //Admin
  } else if (choice == 2) {
    ProductManagement();
  } else if (choice == 3) {
    exit(0);
  } else {
    print("Invalid Choice");
    MainMenu();
  }
}

EmployeeManagement() {
  //Login
  print("========ADMIN LOGIN========");
  print("Enter Username");
  String username = stdin.readLineSync()!;
  print("Enter Password");
  String password = stdin.readLineSync()!;
  if (username == "admin" && password == "admin") {
    print("Login Successfull");
    print("1) Add Employee");
    print("2) View Employee");
    print("3) Update Employee");
    print("4) Delete Employee");
    print("5) Back");
    int choice = int.parse(stdin.readLineSync()!);
    choice == 1
        ? AddEmployee()
        : choice == 2
            ? ViewEmployee()
            : choice == 3
                ? UpdateEmployee()
                : choice == 4
                    ? DeleteEmployee()
                    : choice == 5
                        ? MainMenu() //Turnery Operator Substitue for if else(Single line block of code)
                        : print("Invalid Choice");
    MainMenu();
  }
}

ProductManagement() {}
AddEmployee() {
  print("Enter Employee Name");
  String name = stdin.readLineSync()!;
  print("Enter Employee Age");
  int age = int.parse(stdin.readLineSync()!);
  print("Enter Employee Salary");
  double salary = double.parse(stdin.readLineSync()!);
  print("Enter Employee Designation");
  String designation = stdin.readLineSync()!;
  print("Enter Employee Password (Must be 8 characters long)");
  String password = stdin.readLineSync()!;
  if (password.length == 8) {
    print("Password Set Successfully");
  } else {
    print("Password Must be 8 characters long");
    AddEmployee();
  }
  Employee = {
    "name": name,
    "age": age,
    "salary": salary,
    "designation": designation,
    "password": password,
  };
  Employees.add(Employee);
  print("Employee Added Successfully");
  MainMenu();
}

UpdateEmployee() {}
DeleteEmployee() {}
ViewEmployee() {}
