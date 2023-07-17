import 'dart:io';

class EmployeeManagement {
  int attempt = 0;
  List Employees = [];
  Map Employee = {};

  EmployeeManagement(List Employees) {
    this.Employees = Employees;
  }
  List getEmployees() {
    return this.Employees;
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
      EmployeeManagementLogin(); //Admin
    } else if (choice == 2) {
      //ProductManagement();
    } else if (choice == 3) {
      exit(0);
    } else {
      print("- - - - - - - - - - - -");
      print("Invalid Choice");
      print("- - - - - - - - - - - -");
      MainMenu();
    }
  }

  EmployeeManagementLogin() //ADMIN LOGIN + CRUD Menu
  {
    if (attempt < 4) {
      //Login
      print("========ADMIN LOGIN========");
      stdout.write("Enter Username: ");
      String username = stdin.readLineSync()!;
      print("- - - - - - - - - - - -");
      stdout.write("Enter Password: ");
      String password = stdin.readLineSync()!;
      print("- - - - - - - - - - - -");
      attempt++;
      if (username == "admin" && password == "admin") {
        print("Login Successfull");
        print("Welcome Admin");
        this.EmployeeManagementMenu();
      } else {
        print("Invalid Username or Password");
        print("Returning to Main Menu");
        print("- - - - - - - - - - - -");
        MainMenu();
      }
    } else {
      print("Too many attempts");
      print("Exiting...");
      exit(0);
    }
  }

  EmployeeManagementMenu() {
    print("====================");
    print("1) Add Employee");
    print("- - - - - - - - - - ");
    print("2) View Employee");
    print("- - - - - - - - - - ");
    print("3) Update Employee");
    print("- - - - - - - - - - ");
    print("4) Delete Employee");
    print("- - - - - - - - - - ");
    print("5) LogOut");
    print("====================");
    stdout.write("Enter Input: ");
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
  }

  AddEmployee() {
    stdout.write("Enter Employee ID: ");
    int id = int.parse(stdin.readLineSync()!);
    print("- - - - - - - - - - - - - - -");
    stdout.write("Enter Employee Name: ");
    String name = stdin.readLineSync()!;
    print("- - - - - - - - - - - - - - -");
    stdout.write("Enter Employee Age: ");
    int age = int.parse(stdin.readLineSync()!);
    print("- - - - - - - - - - - - - - -");
    if (age < 18) {
      print("- - - - - - - - - - - - - - -");
      print("Employee Must be 18 or above");
      stdout.write("Do you want to continue? (Y/N): ");
      String choice = stdin.readLineSync()!;
      if (choice == "Y" ||
          choice == "y" ||
          choice == "Yes" ||
          choice == "yes") {
        AddEmployee();
      } else {
        MainMenu();
      }
    }
    print("Enter Employee Salary");
    double salary = double.parse(stdin.readLineSync()!);
    bool isDesignated = false;
    String? designation;
    do {
      print("Select Employee Designation");
      print("1) Manager");
      print("2) Supervisor");
      print("3) Worker");
      int choice = int.parse(stdin.readLineSync()!);
      switch (choice) {
        case 1:
          designation = "Manager";
          isDesignated = true;
          break;
        case 2:
          designation = "Supervisor";
          isDesignated = true;
          break;
        case 3:
          designation = "Worker";
          isDesignated = true;
          break;
        default:
          print("Invalid Choice");
          break;
      }
    } while (!isDesignated);
    print("Enter Employee Password (Must be 8 characters long)");
    String password = stdin.readLineSync()!;
    Employee = {
      "id": id,
      "name": name,
      "age": age,
      "salary": salary,
      "designation": designation,
      "password": password
    };
    Employees.add(Employee);
    print("Employee Added Successfully");
    stdout.write("Do you want to add more Employees? (Y/N): ");
    String choice = stdin.readLineSync()!;
    if (choice == "Y" || choice == "y" || choice == "Yes" || choice == "yes") {
      AddEmployee();
    } else {
      EmployeeManagementMenu();
    }
  }

  UpdateEmployee() {
    print("Enter Employee Name");
    String name = stdin.readLineSync()!;
    for (int i = 0; i < Employees.length; i++) {
      if (Employees[i]["name"] == name) {
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
          "password": password
        };
        Employees[i] = Employee;
        print("Employee Updated Successfully");
        EmployeeManagementMenu();
      }
    }
    print("Employee Not Found");
    MainMenu();
  }

  DeleteEmployee() {
    print("==========Delete Employee===========");
    print("1) Delete by ID");
    print("2) Delete by Name");
    print("3) Back");
    int choice = int.parse(stdin.readLineSync()!);
    choice == 1
        ? DeleteEmployeeByID()
        : choice == 2
            ? DeleteEmployeeByName()
            : choice == 3
                ? EmployeeManagementMenu()
                : print("Invalid Choice");
  }

  DeleteEmployeeByID() {
    bool isFound = false;
    print("Enter Employee ID");
    int id = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < Employees.length; i++) {
      if (Employees[i]["id"] == id) {
        Employees.removeAt(i);
        print("Employee Deleted Successfully");
        isFound = true;
        MainMenu();
      }
    }
    if (!isFound) {
      print("Employee Not Found");
      print("Returning to Main Menu");
      EmployeeManagementMenu();
    }
  }

  DeleteEmployeeByName() {
    bool isFound = false;
    print("Enter Employee Name");
    String name = stdin.readLineSync()!;
    for (int i = 0; i < Employees.length; i++) {
      if (Employees[i]["name"] == name) {
        Employees.removeAt(i);
        print("Employee Deleted Successfully");
        isFound = true;
        MainMenu();
      }
    }
    if (!isFound) {
      print("Employee Not Found");
      print("Returning to Main Menu");
      EmployeeManagementMenu();
    }
  }

  ViewEmployee() {
    print("==========View Employee===========");
    print("1) View by ID");
    print("2) View by Name");
    print("3) View by Designation");
    print("4) View All");
    print("5) Back");
    stdout.write("Enter Input: ");
    int choice = int.parse(stdin.readLineSync()!);
    choice == 1
        ? ViewEmployeeByID()
        : choice == 2
            ? ViewEmployeeByName()
            : choice == 3
                ? ViewEmployeeByDesignation()
                : choice == 4
                    ? ViewAllEmployees()
                    : choice == 5
                        ? EmployeeManagementMenu()
                        : print("Invalid Choice");
  }

  ViewAllEmployees() {
    int emp = 1;
    for (int i = 0; i < Employees.length; i++) {
      print("==========Employee No: $emp ===========");
      print("Employee ID: ${Employees[i]["id"]}");
      print("Employee Name: ${Employees[i]["name"]}");
      print("Employee Age: ${Employees[i]["age"]}");
      print("Employee Salary: ${Employees[i]["salary"]}");
      print("Employee Designation: ${Employees[i]["designation"]}");
      print("Employee Password: ${Employees[i]["password"]}");
      emp++;
    }
    EmployeeManagementMenu();
  }

  ViewEmployeeByID() {
    bool isFound = false;
    print("Enter Employee ID");
    int id = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < Employees.length; i++) {
      if (Employees[i]["id"] == id) {
        print("Employee ID: ${Employees[i]["id"]}");
        print("Employee Name: ${Employees[i]["name"]}");
        print("Employee Age: ${Employees[i]["age"]}");
        print("Employee Salary: ${Employees[i]["salary"]}");
        print("Employee Designation: ${Employees[i]["designation"]}");
        print("Employee Password: ${Employees[i]["password"]}");
        isFound = true;
        MainMenu();
      }
    }
    if (!isFound) {
      print("Employee Not Found");
      print("Returning to Main Menu");
      MainMenu();
    }
  }

  ViewEmployeeByName() {
    bool isFound = false;
    print("Enter Employee Name");
    String name = stdin.readLineSync()!;
    for (int i = 0; i < Employees.length; i++) {
      if (Employees[i]["name"] == name) {
        print("Employee ID: ${Employees[i]["id"]}");
        print("Employee Name: ${Employees[i]["name"]}");
        print("Employee Age: ${Employees[i]["age"]}");
        print("Employee Salary: ${Employees[i]["salary"]}");
        print("Employee Designation: ${Employees[i]["designation"]}");
        print("Employee Password: ${Employees[i]["password"]}");
        isFound = true;
        MainMenu();
      }
    }
    if (!isFound) {
      print("Employee Not Found");
      print("Returning to Main Menu");
      MainMenu();
    }
  }

  ViewEmployeeByDesignation() {
    bool isFound = false;
    print("Enter Employee Designation");
    String designation = stdin.readLineSync()!;
    for (int i = 0; i < Employees.length; i++) {
      if (Employees[i]["designation"] == designation) {
        print("Employee ID: ${Employees[i]["id"]}");
        print("Employee Name: ${Employees[i]["name"]}");
        print("Employee Age: ${Employees[i]["age"]}");
        print("Employee Salary: ${Employees[i]["salary"]}");
        print("Employee Designation: ${Employees[i]["designation"]}");
        print("Employee Password: ${Employees[i]["password"]}");
        isFound = true;
        MainMenu();
      }
    }
    if (!isFound) {
      print("Employee Not Found");
      print("Returning to Main Menu");
      EmployeeManagementMenu();
    }
  }
}
