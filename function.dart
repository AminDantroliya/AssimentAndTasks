import'dart:io';
main()
{
    
    mul(10,2,ans);
    
}
String sum()
{
    print("\n\t EMTER A NUM 1:-->");
    var num1=int.parse(stdin.readLineSync()!);
    print("\n\t EMTER A NUM 2:-->");
    var num2=int.parse(stdin.readLineSync()!);
    var ans;
    return "${ans=num1+num2}";
}
void sub()
{
    int num1=10;
    int num2=5;
    int ans=num1-num2;
    print(num1);
    print(num2);
    print(ans);
}
void mul(var num1=10,var num2=2)
{
    
    print(num1);
    print(num2);
    var ans=num1*num2;
    print(ans);
}