import'dart:io';
main(){
    double month,day;
    print("\n\t Enter A Month:-->");
    day=double.parse(stdin.readLineSync()!);
    print("\n\t Your Month Is:--> ${month = day / 30}");
}