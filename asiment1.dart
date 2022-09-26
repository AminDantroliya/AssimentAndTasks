void input() {
  int num;
  print("Enter number 1 : ");
  int Fnum = int.parse(stdin.readLineSync()!);
  print("Enter number 2 : ");
  int Snum = int.parse(stdin.readLineSync()!);

  num = Fnum;
  Fnum = Snum;
  Snum = num;
  Fnum = Fnum + Snum;
  Snum = Fnum - Snum;
  Fnum = Fnum - Snum;

  print("After swap : \n");
  print("First number : $Fnum , Second number : $Snum");
 91  
DARTS PROGRAM/task/Fruit_market.dart
@@ -0,0 +1,91 @@
import 'dart:io';

class Fruit_market {
  late String fruit_name;
  late int Role, qty, Price;

  void menu() {
    print("Select Your Role : ");
    Role = int.parse(stdin.readLineSync()!);
    if (Role == 1) {
      manager();
    } else if (Role == 2) {
      customer();
    } else {
      print("sorry you not chosen right role");
    }
  }

  void manager() {
    print("Fruit market manager\n");
    print("1) Add fruit stock");
    print("2) view fruit stock");
    print("3) updat fruit stock\n");

    print("Enter your choice : ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      Add_friut_stock();
      view_friut_stock();
      More_option();
    } else if (choice == 2) {
      print("You have not added fruit so first add fruits ");
      Add_friut_stock();
      view_friut_stock();
      More_option();
    } else {
      update_fruit_stock();
      More_option();
    }
  }

  void customer() {
    print("no update right now");
  }

  void Add_friut_stock() {
    print("ADD FRUIT STOCK\n");
    print("Enter fruit Name :");
    fruit_name = stdin.readLineSync()!;

    print("Enter qty (in kg) :");
    qty = int.parse(stdin.readLineSync()!);
    print("Enter price :");
    Price = int.parse(stdin.readLineSync()!);
  }

  void view_friut_stock() {
    print("'$fruit_name' : {'qty' :'$qty' ,'Price' : $Price}");
  }

  void update_fruit_stock() {
    print("no update available");
  }

  void More_option() {
    bool status = true;
    String? choices;
    while (status) {
      print(
          "do you want to perform more operation :  press y for yes and n for no:");
      choices = stdin.readLineSync()!;
      if (choices == 'y') {
        manager();
      } else {
        status = false;
        break;
      }
    }
  }
}

void main() {
  print("\nWelcome to fruit market \n");

  print("   1) Manager");
  print("   2) Customer\n");

  var obj = new Fruit_market();
  obj.menu();
}