import 'dart:io';

void main() {
  var number = 0;

  print("enter your Name");
  var name = stdin.readLineSync()!;
  for (var i = 0; i < name.length; i++) {
    number = number + 1;

    print('$number ${name[i]}');
    if (name[i] == '+' ||
        name[i] == '!' ||
        name[i] == '@' ||
        name[i] == '#' ||
        name[i] == '%') {
      print("synbol");
    } else if (name[i] == 'A' ||
        name[i] == 'B' ||
        name[i] == 'C' ||
        name[i] == 'D' ||
        name[i] == 'E' ||
        name[i] == 'F' ||
        name[i] == 'G' ||
        name[i] == 'H' ||
        name[i] == 'I' ||
        name[i] == 'J' ||
        name[i] == 'K' ||
        name[i] == 'L' ||
        name[i] == 'M' ||
        name[i] == 'N' ||
        name[i] == 'O' ||
        name[i] == 'P' ||
        name[i] == 'Q' ||
        name[i] == 'R' ||
        name[i] == 'S' ||
        name[i] == 'T' ||
        name[i] == 'U' ||
        name[i] == 'V' ||
        name[i] == 'W' ||
        name[i] == 'X' ||
        name[i] == 'Y' ||
        name[i] == 'Z') {
      print("upper alpha");
    } else if (name[i] == 'B' ||
        name[i] == '1' ||
        name[i] == '2' ||
        name[i] == '3' ||
        name[i] == '4' ||
        name[i] == '5' ||
        name[i] == '6' ||
        name[i] == '7' ||
        name[i] == '8' ||
        name[i] == '9' ||
        name[i] == '0') {
      print(" digit ");
    } else {
      print(" lower alpha");
    }
  }
  print("There are in $number cartory");
}