import'dart:io';
main(){
    double month,day,year;
    print("\n\t Enter A Month:-->");
    day=double.parse(stdin.readLineSync()!);
    print("\n\t Your Month Is:--> ${month = day / 30}");
    print("\n\t Your year Is:--> ${year = month / 12}");
}