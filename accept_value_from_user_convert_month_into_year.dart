import'dart:io';
main(){
    double month,year;
    print("\n\t Enter A Month:-->");
    month=double.parse(stdin.readLineSync()!);
    print("\n\t Your Year Is:--> ${year = month / 12}");
}