// WareHouse Mangement System
import 'dart:io';

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

EmployeeMangement() {
  //Login
}
ProductMangement() {}
