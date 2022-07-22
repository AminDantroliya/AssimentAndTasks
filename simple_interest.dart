import'dart:io';
main(){
    final rate=4.5;
    double simple_intress,amount,time;
    print("\n\t Enter Your Amount:-->");
    amount=double.parse(stdin.readLineSync()!);
    print("\n\t Enter Your Time:-->");
    time=double.parse(stdin.readLineSync()!);
    print("Your Intress Is :-->${simple_intress=(amount*rate*time)/100}");
}