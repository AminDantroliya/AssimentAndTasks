import'dart:io';
main(){
    double a,b,c;
    print ("\n\t Enter Num 1:-->");
    a =double.parse(stdin.readLineSync()!);
    print ("\n\t Enter Num 2:-->");
    b =double.parse(stdin.readLineSync()!);

    print ("\n\t Your Sum Is:--> ${c=a+b}");
    print ("\n\t Your Sub Is:--> ${c=a-b}");
    print ("\n\t Your Mul Is:--> ${c=a*b}");
    print ("\n\t Your Div Is:--> ${c=a/b}");

}