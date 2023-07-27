// WareHouse Mangement System
import 'dart:io';
import 'EmployeeManagement.dart';
import 'ProductManagement.dart';

List Employees = []; //List will be used to store all the employees(Maps)
Map Employee = {};
void main() {
  Map Employee1 = {
    "id": 419,
    "name": "Shammas Khan",
    "age": 19,
    "salary": 5000,
    "designation": "Manager",
    "password": "Shammas0312"
  };
  Map Employee2 = {
    "id": 420,
    "name": "Hammad Khan",
    "age": 24,
    "salary": 70000,
    "designation": "Worker",
    "password": "Hammad0312"
  };
  Employees.add(Employee1);
  Employees.add(Employee2);
  do {
    MainMenu();
  } while (true);
}

MainMenu() {
  print("========WAREHOUSE MANAGEMENT SYSTEM========");
  print("1) Manage Employes");
  print("- - - - - - - - - - - -");
  print("2) Manage Products");
  print("- - - - - - - - - - - -");
  print("3) Quit");
  print("- - - - - - - - - - - -");
  stdout.write("Enter Input: ");
  int choice = int.parse(stdin.readLineSync()!);
  if (choice == 1) {
    EmployeeManagement em = new EmployeeManagement(Employees);
    em.EmployeeManagementLogin();
    Employees = em.getEmployees();
  } else if (choice == 2) {
    ProductManagement pm = new ProductManagement(Employees);
    pm.ProductManagementLogin();
  } else if (choice == 3) {
    exit(0);
  } else {
    print("- - - - - - - - - - - -");
    print("Invalid Choice");
    print("- - - - - - - - - - - -");
    MainMenu();
  }
}
