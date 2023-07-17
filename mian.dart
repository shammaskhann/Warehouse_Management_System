// WareHouse Mangement System
import 'dart:io';
import 'EmployeeManagement.dart';
import 'ProductManagement.dart';

int attempt = 0;
List Employees = []; //List will be used to store all the employees(Maps)
Map Employee = {};
void main() {
  Map Employee1 = {
    "id": 1001,
    "name": "Shammas Khan",
    "age": 19,
    "salary": 5000,
    "designation": "Manager",
    "password": "Shammas0312"
  };
  Map Employee2 = {
    "id": 1002,
    "name": "Hammad Khan",
    "age": 19,
    "salary": 5000,
    "designation": "Worker",
    "password": "Hammad0312"
  };
  Employees.add(Employee1);
  do {
    MainMenu();
  } while (true);
}

MainMenu() //lOGIN MENU
{
  print("========WAREHOUSE MANAGEMENT SYSTEM========");
  print("1) Employee Management"); //Admin
  print("- - - - - - - - - - - -");
  print("2) Product Management");
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
