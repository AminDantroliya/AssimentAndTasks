import 'dart:io';
void main() {
  var number = 0;
  var name;
  print("\n\t Enter Your Name:-->");
  name=stdin.readLineSync()!;
  for(int i = 0;i<name.length;i++ )
  {
    number=number+1;
    print("$number ${name[i]}");
  }
  print("\n\t Totle Charecter in Number:-->$number");
}