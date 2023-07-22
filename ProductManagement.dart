import 'dart:io';

import 'mian.dart';

class ProductManagement {
  List Employees = [];
  List Products = [];
  Map product = {};
  int attempt = 0;
  ProductManagement(List Employees) {
    this.Employees = Employees; // initializing the some products for testing
    Map product1 = {
      "name": "Asus Rog Gtx 1080",
      "category": "Electronics",
      "price": 45000,
      "quantity": 50,
      "Added By": "Admin"
    };
    Map product2 = {
      "name": "Gigabyte 6500xt",
      "category": "Electronics",
      "price": 35000,
      "quantity": 100,
      "Added By": "Admin"
    };
    Map product3 = {
      "name": "Dell Inspiron 15",
      "category": "Electronics",
      "price": 150000,
      "quantity": 10,
      "Added By": "Admin"
    };
    Map product4 = {
      "name": "HP Pavilion 15",
      "category": "Electronics",
      "price": 120000,
      "quantity": 10,
      "Added By": "Admin"
    };
    Map product5 = {
      "name": "White Shirt",
      "category": "Clothes",
      "price": 1000,
      "quantity": 10,
      "Added By": "Admin"
    };
    Map product6 = {
      "name": "Black Shirt",
      "category": "Clothes",
      "price": 1000,
      "quantity": 10,
      "Added By": "Admin"
    };
    Map product7 = {
      "name": "Fruits",
      "category": "Food",
      "price": 100,
      "quantity": 100,
      "Added By": "Admin"
    };
    Products.add(product1);
    Products.add(product2);
    Products.add(product3);
    Products.add(product4);
    Products.add(product5);
    Products.add(product6);
    Products.add(product7);
  }

  ProductManagementLogin() {
    bool isLogin = false;
    do {
      bool isLoginCredentialTrue = false;
      bool isAccessable = true;
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
          if (Employees[i]["id"] == id &&
              Employees[i]["password"] == password) {
            isLoginCredentialTrue = true;
            if (Employees[i]["designation"] == "Manager" ||
                Employees[i]["designation"] == "Supervisor") {
              isAccessable = true;
              print("Login Successfull");
              print("=> Welcome ${Employees[i]["name"]}");
              isLogin = true;
              ProductManagementMenu(i);
            } else {
              isAccessable = false;
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
      stdout.write("Do you want to return to Main Menu (y/n): ");
      String choice = stdin.readLineSync()!;
      if (choice == "y" ||
          choice == "Y" ||
          choice == "yes" ||
          choice == "Yes") {
        isLogin = true;
        MainMenu();
      } else {
        isLogin = false;
      }
    } while (isLogin == false);
  }

  ProductManagementMenu(int index) {
    bool isLogout = false;
    do {
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
          print("1) Add New Product");
          print("2) Add Existing Product");
          print("3) Back");
          stdout.write("Enter Input: ");
          int choice = int.parse(stdin.readLineSync()!);
          switch (choice) {
            case 1:
              AddNewProduct(index);
              break;
            case 2:
              AddExistingProduct(index);
              break;
            case 3:
              ProductManagementMenu(index);
              break;
            default:
              print("Invalid Choice");
              ProductManagementMenu(index);
              break;
          }
          break;
        case 2:
          ViewProduct(index);
          break;
        case 3:
          UpdateProduct(index);
          break;
        case 4:
          DeleteProduct(index);
          break;
        case 5:
          print("Logging Out");
          isLogout = true;
          MainMenu();
          break;
        default:
          print("Invalid Choice");
          break;
      }
    } while (isLogout);
  }

  AddNewProduct(int index) {
    String? category;
    bool isValidCategory = false;
    print("========ADD PRODUCT========");
    stdout.write("Enter Product Name: ");
    String name = stdin.readLineSync()!;
    do {
      print("Select Item Catorgory");
      print("1) Electronics");
      print("2) Clothes");
      print("3) Food");
      stdout.write("Enter Input: ");
      int choice1 = int.parse(stdin.readLineSync()!);
      switch (choice1) {
        case 1:
          category = "Electronics";
          isValidCategory = true;
          break;
        case 2:
          category = "Clothes";
          isValidCategory = true;
          break;
        case 3:
          category = "Food";
          isValidCategory = true;
          break;
        default:
          print("Invalid Choice");
          //AddNewProduct(index);
          break;
      }
    } while (isValidCategory);
    stdout.write("Enter Product Price: ");
    int price = int.parse(stdin.readLineSync()!);
    stdout.write("Enter Product Quantity: ");
    int quantity = int.parse(stdin.readLineSync()!);
    if (name == null || price == null || quantity == null) {
      print("Fields cannot be empty");
      AddNewProduct(index);
    }
    product = {
      "name": name,
      "category": category,
      "price": price,
      "quantity": quantity,
      "Added By": Employees[index]["name"]
    };
    Products.add(product);
    print("Product Added Successfully");
    stdout.write("Do you want to add more products? (Y/N): ");
    String choice = stdin.readLineSync()!;
    if (choice == "Y" || choice == "y" || choice == "yes" || choice == "Yes") {
      AddNewProduct(index);
    } else {
      ProductManagementMenu(index);
    }
  }

  AddExistingProduct(int index) {
    print("========ADD EXISTING PRODUCT========");
    stdout.write("Enter Product Name: ");
    String name = stdin.readLineSync()!;
    stdout.write("Enter Product Quantity: ");
    int quantity = int.parse(stdin.readLineSync()!);
    if (name == null || quantity == null) {
      print("Fields cannot be empty");
      AddExistingProduct(index);
    }
    for (int i = 0; i < Products.length; i++) {
      if (Products[i]["name"] == name) {
        Products[i]["quantity"] += quantity;
        Products[i]["Added By"] = Employees[index]["name"];
        print("Product Added Successfully");
        stdout.write("Do you want to add more products? (Y/N): ");
        String choice = stdin.readLineSync()!;
        if (choice == "Y" ||
            choice == "y" ||
            choice == "yes" ||
            choice == "Yes") {
          AddExistingProduct(index);
        } else {
          ProductManagementMenu(index);
        }
      }
    }
    print("Product Not Found");
    stdout.write("Do you want to add more products? (Y/N): ");
    String choice = stdin.readLineSync()!;
    if (choice == "Y" || choice == "y" || choice == "yes" || choice == "Yes") {
      AddExistingProduct(index);
    } else {
      ProductManagementMenu(index);
    }
  }

  ViewProduct(int index) {
    print("========VIEW PRODUCT========");
    print("1) View By Category");
    print("- - - - - - - - - - - ");
    print("2) View By Price Range");
    print("- - - - - - - - - - - ");
    print("3) View All Products");
    print("- - - - - - - - - - - ");
    print("4) Back");
    print("- - - - - - - - - - - ");
    stdout.write("Enter Input: ");
    int choice = int.parse(stdin.readLineSync()!);
    print("- - - - - - - - - - - ");
    switch (choice) {
      case 1:
        ViewByCategory(index);
        break;
      case 2:
        ViewByPriceRange(index);
        break;
      case 3:
        ViewAllProducts(index);
        break;
      case 4:
        ProductManagementMenu(index);
        break;
      default:
        print("Invalid Choice");
        ViewProduct(index);
        break;
    }
  }

  ViewByPriceRange(int index) {
    bool isFound = false;
    print("========VIEW BY PRICE RANGE========");
    stdout.write("Enter Minimum Price: ");
    int minPrice = int.parse(stdin.readLineSync()!);
    stdout.write("Enter Maximum Price: ");
    int maxPrice = int.parse(stdin.readLineSync()!);
    if (minPrice == null || maxPrice == null) {
      print("Fields cannot be empty");
      ViewByPriceRange(index);
    }
    for (int i = 0; i < Products.length; i++) {
      if (Products[i]["price"] >= minPrice &&
          Products[i]["price"] <= maxPrice) {
        isFound = true;
        print("============================");
        print("Product ${i + 1}");
        print("Name: ${Products[i]["name"]}");
        print("Category: ${Products[i]["category"]}");
        print("Price: ${Products[i]["price"]}");
        print("Quantity: ${Products[i]["quantity"]}");
        print("Added By: ${Products[i]["Added By"]}");
        print("============================");
      }
    }
    if (!isFound) {
      print("No Products Found");
    }
    stdout.write("Do you want to view more products? (Y/N): ");
    String choice = stdin.readLineSync()!;
    if (choice == "Y" || choice == "y" || choice == "yes" || choice == "Yes") {
      ViewByPriceRange(index);
    } else {
      ViewProduct(index);
    }
  }

  ViewByCategory(int index) {
    print("========VIEW BY CATEGORY========");
    print("1) Electronics");
    print("- - - - - - - - - - - - - -");
    print("2) Clothes");
    print("- - - - - - - - - - - - - -");
    print("3) Food");
    print("- - - - - - - - - - - - - -");
    print("4) Back");
    print("- - - - - - - - - - - - - -");
    stdout.write("Enter Input: ");
    int choice = int.parse(stdin.readLineSync()!);
    print("- - - - - - - - - - - - - -");
    switch (choice) {
      case 1:
        for (int i = 0; i < Products.length; i++) {
          if (Products[i]["category"] == "Electronics") {
            print("============================");
            print("Product ${i + 1}");
            print("- - - - - - - - - - - - - -");
            print("Name: ${Products[i]["name"]}");
            print("- - - - - - - - - - - - - -");
            print("Category: ${Products[i]["category"]}");
            print("- - - - - - - - - - - - - -");
            print("Price: ${Products[i]["price"]}");
            print("- - - - - - - - - - - - - -");
            print("Quantity: ${Products[i]["quantity"]}");
            print("====================================");
          }
        }
        print("Press Enter to Continue");
        stdin.readLineSync();
        ProductManagementMenu(index);
        break;
      case 2:
        for (int i = 0; i < Products.length; i++) {
          if (Products[i]["category"] == "Clothes") {
            print("============================");
            print("Product ${i + 1}");
            print("- - - - - - - - - - - - - -");
            print("Name: ${Products[i]["name"]}");
            print("- - - - - - - - - - - - - -");
            print("Category: ${Products[i]["category"]}");
            print("- - - - - - - - - - - - - -");
            print("Price: ${Products[i]["price"]}");
            print("- - - - - - - - - - - - - -");
            print("Quantity: ${Products[i]["quantity"]}");
            print("====================================");
          }
        }
        print("Press Enter to Continue");
        stdin.readLineSync();
        ProductManagementMenu(index);
        break;
      case 3:
        for (int i = 0; i < Products.length; i++) {
          if (Products[i]["category"] == "Food") {
            print("============================");
            print("Product ${i + 1}");
            print("- - - - - - - - - - - - - -");
            print("Name: ${Products[i]["name"]}");
            print("- - - - - - - - - - - - - -");
            print("Category: ${Products[i]["category"]}");
            print("- - - - - - - - - - - - - -");
            print("Price: ${Products[i]["price"]}");
            print("- - - - - - - - - - - - - -");
            print("Quantity: ${Products[i]["quantity"]}");
            print("====================================");
          }
        }
        print("Press Enter to Continue");
        stdin.readLineSync();
        ProductManagementMenu(index);
        break;
      default:
        print("Invalid Choice");
        ProductManagementMenu(index);
        break;
    }
  }

  ViewAllProducts(int index) {
    for (int i = 0; i < Products.length; i++) {
      print("============================");
      print("Product ${i + 1}");
      print("- - - - - - - - - - - - - -");
      print("Name: ${Products[i]["name"]}");
      print("- - - - - - - - - - - - - -");
      print("Category: ${Products[i]["category"]}");
      print("- - - - - - - - - - - - - -");
      print("Price: ${Products[i]["price"]}");
      print("- - - - - - - - - - - - - -");
      print("Quantity: ${Products[i]["quantity"]}");
      print("====================================");
    }
    print("Press Enter to Continue");
    stdin.readLineSync();
    ProductManagementMenu(index);
  }

  UpdateProduct(int index) {
    bool isFound = false;
    late String newCategory;
    print("========UPDATE PRODUCT========");
    stdout.write("Enter Product Name: ");
    String name = stdin.readLineSync()!;
    for (int i = 0; i < Products.length; i++) {
      if (Products[i]["name"].toLowerCase() == name.toLowerCase()) {
        isFound = true;
        print("Product Found");
        print("======UPDATE MENU=======");
        print("1) Update Name");
        print("- - - - - - - - - - - - - -");
        print("2) Update Category");
        print("- - - - - - - - - - - - - -");
        print("3) Update Price");
        print("- - - - - - - - - - - - - -");
        print("4) Update Quantity");
        print("- - - - - - - - - - - - - -");
        print("5) Update All");
        print("- - - - - - - - - - - - - -");
        print("6) Return to Menu");
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
            bool isValidCategory = false;
            do {
              print("Select Item Catorgory");
              print("1) Electronics");
              print("2) Clothes");
              print("3) Food");
              stdout.write("Enter Input: ");
              int choice1 = int.parse(stdin.readLineSync()!);
              switch (choice1) {
                case 1:
                  newCategory = "Electronics";
                  isValidCategory = true;
                  break;
                case 2:
                  newCategory = "Clothes";
                  isValidCategory = true;
                  break;
                case 3:
                  newCategory = "Food";
                  isValidCategory = true;
                  break;
                default:
                  print("Invalid Choice");
                  //AddNewProduct(index);
                  break;
              }
              if (isValidCategory == false) {
                print("Select Valid Category");
              }
            } while (isValidCategory == true);
            Products[i]["category"] = newCategory;
            print("Product Category Updated Successfully");
            break;
          case 3:
            stdout.write("Enter New Price: ");
            int newPrice = int.parse(stdin.readLineSync()!);
            Products[i]["price"] = newPrice;
            print("Product Price Updated Successfully");
            break;
          case 4:
            stdout.write("Enter New Quantity: ");
            int newQuantity = int.parse(stdin.readLineSync()!);
            Products[i]["quantity"] = newQuantity;
            print("Product Quantity Updated Successfully");
            break;
          case 5:
            stdout.write("Enter New Name: ");
            String newName = stdin.readLineSync()!;
            stdout.write("Enter New Price: ");
            int newPrice = int.parse(stdin.readLineSync()!);
            stdout.write("Enter New Quantity: ");
            int newQuantity = int.parse(stdin.readLineSync()!);
            Products[i]["name"] = newName;
            Products[i]["price"] = newPrice;
            Products[i]["quantity"] = newQuantity;
            Products[i]["Added By"] = Employees[index]["name"];
            print("Product Updated Successfully");
            break;
          case 6:
            print("Returning to Product Management Menu");
            ProductManagementMenu(index);
            break;
          default:
            print("Invalid Choice");
            break;
        }
      }
    }
    if (isFound == false) {
      print("Product Not Found");
      print("Returning to Product Management Menu");
      ProductManagementMenu(index);
    }
  }

  DeleteProduct(int index) {
    bool isFound = false;
    print("========DELETE PRODUCT========");
    stdout.write("Enter Product Name: ");
    String name = stdin.readLineSync()!;
    for (int i = 0; i < Products.length; i++) {
      if (Products[i]["name"].toLowerCase() == name.toLowerCase()) {
        isFound = true;
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
          ProductManagementMenu(index);
        }
      }
      if (isFound == false) {
        print("Product Not Found");
        print("Returning to Product Management Menu");
        ProductManagementMenu(index);
      }
    }
  }
}
