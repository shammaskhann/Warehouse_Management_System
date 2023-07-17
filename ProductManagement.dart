import 'dart:io';

class ProductManagement {
  List Employees = [];
  List Products = [];
  Map product = {};
  int attempt = 0;
  ProductManagement(List Employees) {
    this.Employees = Employees; // initializing the some products for testing
    Map product1 = {
      "name": "Asus Rog Gtx 1080",
      "price": 45000,
      "quantity": 50
    };
    Map product2 = {"name": "Gigabyte 6500xt", "price": 35000, "quantity": 100};
    Products.add(product1);
    Products.add(product2);
  }
  ProductManagementLogin() {
    bool isLoginCredentialTrue = false;
    bool isAccessable = false;
    if (attempt < 4) {
      //Login
      print("========Inventory LOGIN========");
      stdout.write("Enter ID: ");
      int id = int.parse(stdin.readLineSync()!);
      stdout.write("Enter Password: ");
      String password = stdin.readLineSync()!;
      attempt++;
      //Only Manager and Supervisor can access the Product Management with their Passowrd and name set by ADMIN in List Employees
      for (int i = 0; i < Employees.length; i++) {
        if (Employees[i]["id"] == id && Employees[i]["password"] == password) {
          isLoginCredentialTrue = true;
          if (Employees[i]["designation"] == "Manager" ||
              Employees[i]["designation"] == "Supervisor") {
            isAccessable = true;
            print("Login Successfull");
            print("=> Welcome ${Employees[i]["name"]}");
            ProductManagementMenu();
          }
        }
      }
    } else {
      print("Too many attempts");
      print("Exiting...");
      exit(0);
    }
    if (isLoginCredentialTrue == false) {
      print("Invalid Username or Password");
    }
    if (isAccessable == false) {
      print("=> Note:");
      print("Workers are not allowed to access this menu");
    }
  }

  ProductManagementMenu() {
    print("========PRODUCT MANAGEMENT Menu ========");
    print("1) Add Product to Warehouse");
    print("- - - - - - - - - - - - - -");
    print("2) View Product in Warehouse");
    print("- - - - - - - - - - - - - -");
    print("3) Update Product in Warehouse");
    print("- - - - - - - - - - - - - -");
    print("4) Delete Product in Warehouse");
    print("- - - - - - - - - - - - - -");
    print("5) LOG OUT");
    print("- - - - - - - - - - - - - -");
    stdout.write("Enter Input: ");
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        AddProduct();
        break;
      case 2:
        ViewProduct();
        break;
      case 3:
        UpdateProduct();
        break;
      case 4:
        DeleteProduct();
        break;
      case 5:
        print("Logging Out");
        break;
      default:
        print("Invalid Choice");
        break;
    }
  }

  AddProduct() {
    print("========ADD PRODUCT========");
    stdout.write("Enter Product Name: ");
    String name = stdin.readLineSync()!;
    stdout.write("Enter Product Price: ");
    int price = int.parse(stdin.readLineSync()!);
    stdout.write("Enter Product Quantity: ");
    int quantity = int.parse(stdin.readLineSync()!);
    product = {"name": name, "price": price, "quantity": quantity};
    Products.add(product);
    print("Product Added Successfully");
    stdout.write("Do you want to add more products? (Y/N): ");
    String choice = stdin.readLineSync()!;
    if (choice == "Y" || choice == "y" || choice == "yes" || choice == "Yes") {
      AddProduct();
    } else {
      ProductManagementMenu();
    }
  }

  ViewProduct() {
    print("========VIEW PRODUCT========");
    for (int i = 0; i < Products.length; i++) {
      print("============================");
      print("Product ${i + 1}");
      print("- - - - - - - - - - - - - -");
      print("Name: ${Products[i]["name"]}");
      print("- - - - - - - - - - - - - -");
      print("Price: ${Products[i]["price"]}");
      print("- - - - - - - - - - - - - -");
      print("Quantity: ${Products[i]["quantity"]}");
      print("====================================");
    }
    ProductManagementMenu();
  }

  UpdateProduct() {
    print("========UPDATE PRODUCT========");
    stdout.write("Enter Product Name: ");
    String name = stdin.readLineSync()!;
    for (int i = 0; i < Products.length; i++) {
      if (Products[i]["name"] == name) {
        print("Product Found");
        print("======UPDATE MENU=======");
        print("1) Update Name");
        print("- - - - - - - - - - - - - -");
        print("2) Update Price");
        print("- - - - - - - - - - - - - -");
        print("3) Update Quantity");
        print("- - - - - - - - - - - - - -");
        print("4) Update All");
        print("- - - - - - - - - - - - - -");
        stdout.write("Enter Choice: ");
        int choice = int.parse(stdin.readLineSync()!);
        print("- - - - - - - - - - - - - -");
        switch (choice) {
          case 1:
            stdout.write("Enter New Name: ");
            String newName = stdin.readLineSync()!;
            Products[i]["name"] = newName;
            print("Product Name Updated Successfully");
            break;
          case 2:
            stdout.write("Enter New Price: ");
            int newPrice = int.parse(stdin.readLineSync()!);
            Products[i]["price"] = newPrice;
            print("Product Price Updated Successfully");
            break;
          case 3:
            stdout.write("Enter New Quantity: ");
            int newQuantity = int.parse(stdin.readLineSync()!);
            Products[i]["quantity"] = newQuantity;
            print("Product Quantity Updated Successfully");
            break;
          case 4:
            stdout.write("Enter New Name: ");
            String newName = stdin.readLineSync()!;
            stdout.write("Enter New Price: ");
            int newPrice = int.parse(stdin.readLineSync()!);
            stdout.write("Enter New Quantity: ");
            int newQuantity = int.parse(stdin.readLineSync()!);
            Products[i]["name"] = newName;
            Products[i]["price"] = newPrice;
            Products[i]["quantity"] = newQuantity;
            print("Product Updated Successfully");
            break;
          default:
            print("Invalid Choice");
            break;
        }
      } else {
        print("Product Not Found");
      }
    }
  }

  DeleteProduct() {
    print("========DELETE PRODUCT========");
    stdout.write("Enter Product Name: ");
    String name = stdin.readLineSync()!;
    for (int i = 0; i < Products.length; i++) {
      if (Products[i]["name"] == name) {
        print("Product Found");
        print("Are you sure you want to delete this product? (Y/N): ");
        String choice = stdin.readLineSync()!;
        if (choice == "Y" ||
            choice == "y" ||
            choice == "yes" ||
            choice == "Yes") {
          Products.removeAt(i);
          print("Product Deleted Successfully");
        } else {
          print("Returning to Product Management Menu");
        }
      } else {
        print("Product Not Found");
      }
    }
  }
}
